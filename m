Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56712E58
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="nOuuTEyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1697816921; bh=aqipk7MccsdvCw614Xb53GtCgNE/JoSDwDEs0moQFUM=;
	h=From:To:Cc:Subject:Date;
	b=nOuuTEyK/TpBW9mS4bwpwUghizgRTeMR5ltuEVJHr/HvDlOX9pmB7C77zxJ8YWnyr
	 9ushs9np4afc4xsJ7fwAZVTZEuWaFzxnILh0fwUTsW4XyVILXsbKJbcI/o2N7wgTlP
	 ykQR7k/+tmcQefdK8QuwGnHCr/X5sAdUy8G8sDg0=
Received: from pipishuo-VirtualBox.. ([223.79.36.111])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 2F4B202D; Fri, 20 Oct 2023 23:11:52 +0800
X-QQ-mid: xmsmtpt1697814712thl4wkavy
Message-ID: <tencent_2E5278ECD059882823EF2A5209D98B53E306@qq.com>
X-QQ-XMAILINFO: MR/iVh5QLeieGzKmBbGQncG/OfyXZXkOqUb+vIdWT0hKbxTeAug6nA90fEtnpZ
	 GXqgIdHzX51FoY7WxIHp4M0jzNNjXcbd3Mg3qp3ulNv3i5dcIwCIs/1uX7HDI9NCf7HMC1TSkgvT
	 3D5HmJA9an3OKw+SbN3RTtMhlSUFK4OLlgfDzM5hVDuNt1IWDHSIZax+vzDmSeQNk43jm2UfzFov
	 2MHfrM69nytt8WHPWJORUjzUfC9VaTJf3pPPT+vfyk88kVKy0xzL1ET859zBpW6/3Z+g14/80Bv5
	 o8r8zml7aiygrzZ51rqKKUHF5PDRN8f/FPyrWXxiZM87e6w789oWTYEd7ttCytG8RQ3QKcKkLaud
	 wuurEu3O/vjascgSiqwRFyFU0iHe/ZZO0qCtYgjg/uEjKujR2GZXcUSsLl+iVf0KNtewRLxsS4oC
	 ckcWC47VgvEUfZ8RK8AkIeetZ/N4gHMbMhJVDHXxrg2Q94fVh9UCyMv3nqPSeK/+iGG+wVWC+x/H
	 0j9QDJJChbc5mNI9/uHILIvUySCOQtZT/FkHkh0wKugHecW7YKZxsJgOiXCUbEaMyoCVoP1hblBz
	 n+yVfh7KYtOlvWyJ8w7s5Jqink2DrEpfRYlp3toBS8bSoReKTdF+dlJHq3H8aX2SSH5vqf24dnrX
	 6zFXvbjdBRTmbB10Kd1FqU9U3YFvZdEQJKDUvb5l1MT2WDe8y1D0xOrSCMjcmkWk0fEta8FUrU4D
	 5GtH14N1nLgewLqnMa/jlFPa85C7TJGP7LJeMNdsCe2S7JNXSCzuA9QwbwSbyvC9/se5mTIPE2T8
	 HOvkFi7NloSbk5Gkk6aQJSIZ4qijvWSR+gbyGJF2RYVDEI0HoqgcjLUvV6lvcxq9C17PxEjNbIEK
	 MjjxT2EtjdFb5YPPJK9Q4xGEPZ79ZOdgW3fex/rWNXFyi5P1OpDEhxEOoJJog4MkN71u/o7ifxzA
	 5vLEYuWv780fcE9DX6GdsdgIKZbJ3BY6MaxxBAWO4Yj9631s38ta/SVnmLKhybDKPnxe7HwH9GSg
	 B1MRxdtP9jU7WzCi/apziKLSND9A+1JFAQyD3imsE86nnucjzy/0c65IAC2go=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Chen Shuo <1289151713@qq.com>
To: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen Shuo <1289151713@qq.com>
Subject: [PATCH] staging: greybus: camera: fixes alignment should match open parenthesis
Date: Fri, 20 Oct 2023 23:12:03 +0800
X-OQ-MSGID: <20231020151203.4700-1-1289151713@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the checks reported by checkpatch.pl
for alignment should match open parenthesis

Signed-off-by: Chen Shuo <1289151713@qq.com>
---
 drivers/staging/greybus/camera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..ed9e16bab4cc 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -378,7 +378,7 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_configure_streams_response *resp,
 		struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
-- 
2.34.1

