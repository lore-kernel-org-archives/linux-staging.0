Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014CB2C94
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 20:24:17 +0000 (UTC)
Received: from dslb-178-004-168-180.178.004.pools.vodafone-ip.de ([178.4.168.180] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mcveg-0003ho-3Z; Tue, 19 Oct 2021 22:24:14 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: fix memleak in rtw_wx_set_enc_ext
Date: Tue, 19 Oct 2021 22:23:56 +0200
Message-Id: <20211019202356.12572-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Free the param struct if the caller sets an unsupported algorithm
and we return an error.

Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 4f0ae821d193..4e51d5a55985 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1897,7 +1897,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
 	struct ieee_param *param = NULL;
 	struct iw_point *pencoding = &wrqu->encoding;
 	struct iw_encode_ext *pext = (struct iw_encode_ext *)extra;
-	int ret = 0;
+	int ret = -1;
 
 	param_len = sizeof(struct ieee_param) + pext->key_len;
 	param = kzalloc(param_len, GFP_KERNEL);
@@ -1923,7 +1923,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
 		alg_name = "CCMP";
 		break;
 	default:
-		return -1;
+		goto out;
 	}
 
 	strlcpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
@@ -1950,6 +1950,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
 
 	ret =  wpa_set_encryption(dev, param, param_len);
 
+out:
 	kfree(param);
 	return ret;
 }
-- 
2.20.1

