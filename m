Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BBB2C81
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 09:47:38 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id m17so45697432edc.12
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=c2/iQfGLj/BfZo3NqunRjAQVmBl6HspwKB+KC+UbGIE=;
        b=BKb49zoF+AzrNFDWYyNt4T3J0c2JmRDvhbTIOQovepj44ytGoY4+Z9N+CWStgzVV9c
         2AfP2hWUZ5cfGLntSmCqy8galNWsyn00eRxMoH45B8kgKjWvWLvgbcCTSMABKPcbwe8g
         lr6jZ/nOBCQofQ1ydsp+10LtpXWaAgqe31hgLAb2OD64Pb12okNrgxR8lJe0w3uhXSWC
         C8lpMUBP117e0X/YZWwwuoxFHmS95+2mU73FtJU6Op+U48h9zKraeWF3GP34VlSUiW6K
         QjF0nsjGA6giIOuhKjkGgTPA/HjPM1sCUkGvnOi4whEcC4yQbO2v+cqbsvw0FZ4tYbSh
         b1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=c2/iQfGLj/BfZo3NqunRjAQVmBl6HspwKB+KC+UbGIE=;
        b=SDkDKimyQsP0XLNvFosxXnqL7lgdl1alE+TJss0P1KCT/NKVYZFTTz94pD8+FXZmUa
         QPy2bVR7EliQXA1N6B/b7jgpoPszv1YbUYiEMJJq/fqD5B60P62vIv9wHbLiy/sDgXB+
         8YaVaiIA3ZLUXkpbZwZDsI9rbf2gM/m7GhxJfIqYy1ZxCQG3VVlHPYuGDTRm83C4iZCu
         csvpblACmO0V+urJiMMQrRETi0QfHRx428dhnl+FgMlyCcCieO1i7MNxI1jJUJ+nHfHJ
         ogSBc+goc6tW6ruVOx8+nQC/VKOpY0znNa7CSR5d+4stwcC5NhKCK/3Ike9oU38DHhcv
         CYdA==
X-Gm-Message-State: AOAM530LBOkI0DKsLazEOW8Y57WmscmZ/k5/J5DN84RTSh0GrYd+CXI9
	r1Ikw+fQstCGtkLluotYL3P8bwZb3wQyYAIm
X-Google-Smtp-Source: ABdhPJxgzucDPkLjiEEFJ9Yit75ZkFyR3PmGeBNJViqMXsFYl8OFLwNrACqeZTqVGrMRnV9IvLmkiQ==
X-Received: by 2002:a17:907:7f11:: with SMTP id qf17mr20218118ejc.437.1635587257015;
        Sat, 30 Oct 2021 02:47:37 -0700 (PDT)
Received: from desktop (mob-5-90-201-67.net.vodafone.it. [5.90.201.67])
        by smtp.gmail.com with ESMTPSA id hs8sm692637ejc.53.2021.10.30.02.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 02:47:36 -0700 (PDT)
Date: Sat, 30 Oct 2021 11:47:35 +0200
From: Gabriel Goller <gabrielgoller123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: Cleanup fix parenthesis alignment
Message-ID: <YX0Ut9BaVBQk5Z/g@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes some style-warnings of checkpatch.pl:
Alignment should match open parenthesis.

Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 7951bd63816f..de2980c69711 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -476,8 +476,8 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
 				return -EINVAL;
 
 			result = prism2_domibset_uint32(wlandev,
-				DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
-				sme->key_idx);
+							DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
+							sme->key_idx);
 			if (result)
 				goto exit;
 
@@ -589,8 +589,8 @@ static int prism2_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
 		data = MBM_TO_DBM(mbm);
 
 	result = prism2_domibset_uint32(wlandev,
-		DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
-		data);
+					DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
+					data);
 
 	if (result) {
 		err = -EFAULT;
-- 
2.30.2

