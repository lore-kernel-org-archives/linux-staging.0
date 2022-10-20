Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712D7B;
	Thu, 20 Oct 2022 21:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666301241; bh=Z+VG00Bz+MqCLxk3bOeCCdRBcry1M+c82M61bL+Qfho=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=HG3V0WZeCX+bY02ChW3ggUuLoHKA6XBC27RpT+HqhpEcZJ3v6xOPz/1zJN87ce+51
	 XYfQ3riDeRkTb9KdQ9SI732XCtoXTsTLnTaJlf1iEoz3KD7j+H699/iNGSKeJbtzbD
	 ffC/g84bxM76s/ZI2lo76YTBWTVjzPh4Ue2gt+pc=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 23:27:21 +0200 (CEST)
X-EA-Auth: /9poAHYZcrK/Wv1IuSYCeojHh6q7xwja4LEfweSX98onskwOcDQV30QmMCiGZO+5NVi5kR8V06qqooqJ9sWVSMNEI0fFsaes
Date: Fri, 21 Oct 2022 02:57:16 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v4 02/11] staging: r8188eu: reformat long computation lines
Message-ID: <e07506ef1dc4ac1d3f8b076a8182628bd0e5cec0.1666299151.git.drv@mailo.com>
References: <cover.1666299151.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666299151.git.drv@mailo.com>

Reformat long running computation instructions to improve code readability.
Address checkpatch script complaints like:
	CHECK: line length of 171 exceeds 100 columns

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v4:
   -- As the variable name is shorter now, the reformatting is more clearer.

Changes in v3:
   -- None

Changes in v1 [actually v2]:
   1. Further improve the formatting per feedback from gregkh@linuxfoundation.org


 drivers/staging/r8188eu/core/rtw_br_ext.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index e509b8454e25..d4059f0fc362 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -212,7 +212,7 @@ static int __nat25_network_hash(unsigned char *addr)
 		unsigned long x;

 		x = addr[1] ^ addr[2] ^ addr[3] ^ addr[4] ^ addr[5] ^
-			addr[6] ^ addr[7] ^ addr[8] ^ addr[9] ^ addr[10];
+		    addr[6] ^ addr[7] ^ addr[8] ^ addr[9] ^ addr[10];

 		return x & (NAT25_HASH_SIZE - 1);
 	} else if (addr[0] == NAT25_APPLE) {
@@ -224,16 +224,16 @@ static int __nat25_network_hash(unsigned char *addr)
 	} else if (addr[0] == NAT25_PPPOE) {
 		unsigned long x;

-		x = addr[0] ^ addr[1] ^ addr[2] ^ addr[3] ^ addr[4] ^ addr[5] ^ addr[6] ^ addr[7] ^ addr[8];
+		x = addr[0] ^ addr[1] ^ addr[2] ^ addr[3] ^ addr[4] ^
+		    addr[5] ^ addr[6] ^ addr[7] ^ addr[8];

 		return x & (NAT25_HASH_SIZE - 1);
 	} else if (addr[0] == NAT25_IPV6) {
 		unsigned long x;

-		x = addr[1] ^ addr[2] ^ addr[3] ^ addr[4] ^ addr[5] ^
-			addr[6] ^ addr[7] ^ addr[8] ^ addr[9] ^ addr[10] ^
-			addr[11] ^ addr[12] ^ addr[13] ^ addr[14] ^ addr[15] ^
-			addr[16];
+		x = addr[1] ^ addr[2] ^ addr[3] ^ addr[4] ^ addr[5] ^ addr[6] ^
+		    addr[7] ^ addr[8] ^ addr[9] ^ addr[10] ^ addr[11] ^ addr[12] ^
+		    addr[13] ^ addr[14] ^ addr[15] ^ addr[16];

 		return x & (NAT25_HASH_SIZE - 1);
 	} else {
--
2.30.2



