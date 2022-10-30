Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB9F191
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 08:10:34 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id f7so7838020edc.6
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ7i0JvA6S2JuLGZoRuDp03Ajf9dqeVkCmxRUIqVwsg=;
        b=UyCPntXNQ0ukh7YFw3calkwPkRS6ybko2jmJT21uHy39lfS76EE/6yKfl66uzOddhh
         TBu4dJscMNXjtTkG8SI6S5jMUV9z1672YCsOhjpCwnu37hvrE7aNh0Dv1yaxc2mhfaay
         XgcWt3MY3JCZTSVsoEPUMZrCsgiA25+8m6wAEQYd6bDimx+pHhOEsaIj6H/IkXX9DzaY
         +qnfqddVI4nABEHIvQdyZ9TPDGqNA/z73MrdVFyifBTSfQ1kUuC05IITq82iLnOptscN
         ptgpv09V8SZ8afUijdzJWSJUZ4vyOnrGCdWIZlaTxIKQXSocvztozYl67bMgrfLqluj6
         G0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQ7i0JvA6S2JuLGZoRuDp03Ajf9dqeVkCmxRUIqVwsg=;
        b=68a971uNktiqhCBAPnhlpp5eSzU38xqlEfPRGFnJoRa8NmB1QkxjgjxgYE+z91iWW7
         UZ2b0z0LPgHNIkB1gP8IUumWWpsJLInQYe2+sxZswg9psKbz0D5909eZKjfO0uOHL1WX
         WtRGbpddD9+JSC1Dgibv3FTySWWIVZmwXinREqyGBwFZmO2k2u/t40BGbWR2AYCzCGr3
         E/UCFf81bSTow/yorTmJtGkfHoJSd5gNY6R6vSf/aSM36dDQ7k8Y8vpX7xc2TALSZJjJ
         6yVBncuqn4wSptkyD/75U2cAt+XqR4QQU0uiFXHlInJjOQNqg7ySp3lYq2WV9WJW0//F
         kJzQ==
X-Gm-Message-State: ACrzQf2oysUXCwkz6uj/CsuDokLbYvFDTJ+/MkO5Z0NBC2UmQ8Ou9ADu
	7pv2k3IGaV7p8lPZDPTM0qw=
X-Google-Smtp-Source: AMsMyM76qqm07bZab47IsZf4MMb1ozUN42P8iWvASUTA1VPGFcBGs0gzXWaDObygso6EVOOlGe5iNQ==
X-Received: by 2002:a05:6402:33c5:b0:447:e4a3:c930 with SMTP id a5-20020a05640233c500b00447e4a3c930mr7690017edc.401.1667117432262;
        Sun, 30 Oct 2022 01:10:32 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb7e.dynamic.kabel-deutschland.de. [95.90.187.126])
        by smtp.gmail.com with ESMTPSA id la10-20020a170907780a00b0079dbf06d558sm1567299ejc.184.2022.10.30.01.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 01:10:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: use min() instead of ternary operator
Date: Sun, 30 Oct 2022 09:10:20 +0100
Message-Id: <20221030081020.8533-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.38.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a ternary operator usage with the min() macro to improve
readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 8516e253bb03..22aab3f986b4 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3568,7 +3568,7 @@ static int rtw_wx_set_priv(struct net_device *dev,
 
 		if ((_VENDOR_SPECIFIC_IE_ == probereq_wpsie[0]) &&
 		    (!memcmp(&probereq_wpsie[2], wps_oui, 4))) {
-			cp_sz = probereq_wpsie_len > MAX_WPS_IE_LEN ? MAX_WPS_IE_LEN : probereq_wpsie_len;
+			cp_sz = min(probereq_wpsie_len, MAX_WPS_IE_LEN);
 
 			pmlmepriv->wps_probe_req_ie_len = 0;
 			kfree(pmlmepriv->wps_probe_req_ie);
-- 
2.38.0

