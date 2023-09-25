Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF211C91
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D79BC433C7;
	Mon, 25 Sep 2023 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695657259;
	bh=B4lato5sKbIJfj/DcTxCJi6Fpi7KSgnK6AAG1dAv0WI=;
	h=From:To:Cc:Subject:Date:From;
	b=Xz+FlTT0VGq3tgbriqS2EDaNs11wwdg05SylJzWh/+MjuJrj6gv1A33uV0K9z5PZC
	 uOISJiUJKkEfwop5py2fR6lDz+1iQQ6PHYEaklwFtAntZ98Sjo2CZkjVZQB6/mZ4W1
	 7E+xM/4XJFyE5im3h2UkBLth88NECJC+iYzwrzAW1r5CdowA+gkpxrOIGwIrt8sjW2
	 g7J6SLzreVvMH81sYwZlSKjZpAFTQR6r/s+P4suoajmsgKqxGuadxO7oXDBUklo+s+
	 cPSE8QCwH/QgHLGt4KMavTHbP2MAqnGwY8I+Cq8haydsunntR0FqvgV3tQkU46n1TB
	 WY+A+7V+baI3w==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tree Davies <tdavies@darkphysics.net>,
	Yogesh Hegde <yogi.kernel@gmail.com>,
	Sumitra Sharma <sumitraartsy@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8192e: fix structure alignment
Date: Mon, 25 Sep 2023 17:54:03 +0200
Message-Id: <20230925155413.471287-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A recent cleanup changed the rtl8192e from using the custom misaligned
rtllib_hdr_3addr structure to the generic ieee80211_hdr_3addr definition
that enforces 16-bit structure alignment in memory.

This causes a gcc warning about conflicting alignment requirements:

drivers/staging/rtl8192e/rtllib.h:645:1: error: alignment 1 of 'struct rtllib_authentication' is less than 2 [-Werror=packed-not-aligned]
  645 | } __packed;
      | ^
rtllib.h:650:1: error: alignment 1 of 'struct rtllib_disauth' is less than 2 [-Werror=packed-not-aligned]
rtllib.h:655:1: error: alignment 1 of 'struct rtllib_disassoc' is less than 2 [-Werror=packed-not-aligned]
rtllib.h:661:1: error: alignment 1 of 'struct rtllib_probe_request' is less than 2 [-Werror=packed-not-aligned]
rtllib.h:672:1: error: alignment 1 of 'struct rtllib_probe_response' is less than 2 [-Werror=packed-not-aligned]
rtllib.h:683:1: error: alignment 1 of 'struct rtllib_assoc_request_frame' is less than 2 [-Werror=packed-not-aligned]
rtllib.h:691:1: error: alignment 1 of 'struct rtllib_assoc_response_frame' is less than 2 [-Werror=packed-not-aligned]

Change all of the structure definitions that include this one to also
use 16-bit alignment. This assumes that the objects are actually aligned
in memory, but that is normally guaranteed by the slab allocator already.

All members of the structure definitions are already 16-bit aligned,
so the layouts do not change. As an added benefit, 16-bit accesses are
generally faster than 8-bit accesses, so architectures without unaligned
load/store instructions can produce better code now by avoiding byte-wise
accesses.

Fixes: 71ddc43ed7c71 ("staging: rtl8192e: Replace struct rtllib_hdr_3addr in structs of rtllib.h")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/rtl8192e/rtllib.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5517b9df65bee..7d26910a0b162 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -642,23 +642,23 @@ struct rtllib_authentication {
 	__le16 status;
 	/*challenge*/
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_disauth {
 	struct ieee80211_hdr_3addr header;
 	__le16 reason;
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_disassoc {
 	struct ieee80211_hdr_3addr header;
 	__le16 reason;
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_probe_request {
 	struct ieee80211_hdr_3addr header;
 	/* SSID, supported rates */
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_probe_response {
 	struct ieee80211_hdr_3addr header;
@@ -669,7 +669,7 @@ struct rtllib_probe_response {
 	 * CF params, IBSS params, TIM (if beacon), RSN
 	 */
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 /* Alias beacon for probe_response */
 #define rtllib_beacon rtllib_probe_response
@@ -680,7 +680,7 @@ struct rtllib_assoc_request_frame {
 	__le16 listen_interval;
 	/* SSID, supported rates, RSN */
 	struct rtllib_info_element info_element[];
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_assoc_response_frame {
 	struct ieee80211_hdr_3addr header;
@@ -688,7 +688,7 @@ struct rtllib_assoc_response_frame {
 	__le16 status;
 	__le16 aid;
 	struct rtllib_info_element info_element[]; /* supported rates */
-} __packed;
+} __packed __aligned(2);
 
 struct rtllib_txb {
 	u8 nr_frags;
-- 
2.39.2

