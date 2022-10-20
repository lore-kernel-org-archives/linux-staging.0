Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7A728E2;
	Thu, 20 Oct 2022 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666252417; bh=zHYAYQCcnlsxx2uC96j0anWRnyR5lcqsPx8S7lulGuw=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=kZt9Qh5uE3ToX8QkJapntuXJRsV8Xu17ntQb90uyMOngJnKhwiZIAO3IhwmKHKE9N
	 IzH6IaiTCQ6HzxQn9714R33WvPzMOpfkxQkiwlAF0A+Lao5X0DAhqN2zT/yZphv7Ft
	 GjkFmuet1VipI+hQ0NnfkY8n0ib6Nbjl2KdPn3jY=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 09:53:37 +0200 (CEST)
X-EA-Auth: kxwkC+LfXIT3Z/qsXSiQHzyS/fMd9zQmbbMn0YHsvakVQZbis0gT72PNJ4vhhmSFLi1hIqNbSWVER2GXr+cVDYjGicv9xkwL
Date: Thu, 20 Oct 2022 13:23:32 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v3 02/10] staging: r8188eu: reformat long computation lines
Message-ID: <5c3c0ef7c90ab2eec73067e1dd88f337932363e3.1666249716.git.drv@mailo.com>
References: <cover.1666249715.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666249715.git.drv@mailo.com>

Reformat long running computation instructions to improve code readability.
Address checkpatch script complaints like:
	CHECK: line length of 171 exceeds 100 columns

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v3:
   -- None

Changes in v1 [actually v2]:
   1. Further improve the formatting per feedback from gregkh@linuxfoundation.org


 drivers/staging/r8188eu/core/rtw_br_ext.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 79daf8f269d6..8b1c9fdf6ed2 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -211,8 +211,9 @@ static int __nat25_network_hash(unsigned char *network_addr)
 	} else if (network_addr[0] == NAT25_IPX) {
 		unsigned long x;

-		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^ network_addr[5] ^
-			network_addr[6] ^ network_addr[7] ^ network_addr[8] ^ network_addr[9] ^ network_addr[10];
+		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^
+		    network_addr[5] ^ network_addr[6] ^ network_addr[7] ^ network_addr[8] ^
+		    network_addr[9] ^ network_addr[10];

 		return x & (NAT25_HASH_SIZE - 1);
 	} else if (network_addr[0] == NAT25_APPLE) {
@@ -224,16 +225,18 @@ static int __nat25_network_hash(unsigned char *network_addr)
 	} else if (network_addr[0] == NAT25_PPPOE) {
 		unsigned long x;

-		x = network_addr[0] ^ network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^ network_addr[5] ^ network_addr[6] ^ network_addr[7] ^ network_addr[8];
+		x = network_addr[0] ^ network_addr[1] ^ network_addr[2] ^ network_addr[3] ^
+		    network_addr[4] ^ network_addr[5] ^ network_addr[6] ^ network_addr[7] ^
+		    network_addr[8];

 		return x & (NAT25_HASH_SIZE - 1);
 	} else if (network_addr[0] == NAT25_IPV6) {
 		unsigned long x;

-		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^ network_addr[5] ^
-			network_addr[6] ^ network_addr[7] ^ network_addr[8] ^ network_addr[9] ^ network_addr[10] ^
-			network_addr[11] ^ network_addr[12] ^ network_addr[13] ^ network_addr[14] ^ network_addr[15] ^
-			network_addr[16];
+		x = network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ network_addr[4] ^
+		    network_addr[5] ^ network_addr[6] ^ network_addr[7] ^ network_addr[8] ^
+		    network_addr[9] ^ network_addr[10] ^ network_addr[11] ^ network_addr[12] ^
+		    network_addr[13] ^ network_addr[14] ^ network_addr[15] ^ network_addr[16];

 		return x & (NAT25_HASH_SIZE - 1);
 	} else {
--
2.30.2



