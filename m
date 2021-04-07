Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1326D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:37:11 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso766011pjh.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BtyBOMvsqSJAayOGR2ps6Fm5o+TmuUaUOXkQzK0Am80=;
        b=FYxkr4zNiq+MJV0WrNM/yKUHigyUboVN9BVJ/JJ5qxDsVp7R+hZCNWzmv3aSNvZcvD
         2uIguRDT37Etg0K2v4exBizNKH2BtXOMR+bpoXs08TP7sZ4mJFZlAa4zDfYQhXujiuaU
         IUzokmik9TLiLYU8vVaKyySF3kAUQZhKE6FOUim5T8qas27ror5wckKPsJod7tThnTul
         XKkx8vQpAVWpwmPGqdvBOkEGjSUo0xIchc0wdYe6x3R58WuQFNXiAptRPCeLCl1Ymls9
         u1v0nUo3g0tNdqVReKWPhw8Tc3aNhzLHS7oZYIg92ZHE8509ju4NxoIlTJmC6eiqpnpr
         2slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BtyBOMvsqSJAayOGR2ps6Fm5o+TmuUaUOXkQzK0Am80=;
        b=qLeNA1feKjR929l1gvsA/r719fo/KRP0DLjmdPSbr4mNSSIGY1pLZkDh/rwwERLB7i
         Rx2ybm542WLUbomVvNKpjrb1bvFmeQ6gMY+n/YHUSlu6XhTM8gNLV4owf6QXf0t7nG/D
         JP1fBRi9jvKVrdGRhP9fS+wWc83Se/UKm8KviMgouiPijNQiPEG6m8gDsXDJVdMi2P1k
         8eDhCchsPcxZEbK17gU2Op0JMbumvTwj+aGmOi98QIS/LnIjDMSyf1s6rpdzmGqPqu05
         GuRWL0T6cmdYbua/AQZEV61taMOqCM0VVWZWcKfCdnp8NkQOb1Tp9F6n5Oh4/1wXQhz1
         wacA==
X-Gm-Message-State: AOAM533mR95voi4KZbGz0dBY4MXOFqKko+J7v2J4EIyphEPulxxq0yJX
	FTowxW29zOG4aEeLmLL9dAI=
X-Google-Smtp-Source: ABdhPJx62uNLl6w6YDWL21XyY3o6O682yByIaQI1OCkg2oivnbKc6M+sEPhfMEzwkSr20Tun3HEiDQ==
X-Received: by 2002:a17:902:f686:b029:e5:de44:af60 with SMTP id l6-20020a170902f686b02900e5de44af60mr1772297plg.64.1617777430958;
        Tue, 06 Apr 2021 23:37:10 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id w203sm19836430pfc.188.2021.04.06.23.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:37:10 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:37:08 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/49] staging: sm750fb: Rename
 sii164SelectHotPlugDetectionMode to snake case
Message-ID: <39d33b45117c205208b6fa9c21ac9d32eaa9c5b1.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the function
sii164SelectHotPlugDetectionMode in ddk750_sii164.c.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_sii164.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index ceeb914f8441..7e0a481970f5 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -298,11 +298,11 @@ void sii164_set_power(unsigned char powerUp)
 }
 
 /*
- *  sii164SelectHotPlugDetectionMode
+ *  sii164_select_hot_plug_detection_mode
  *      This function selects the mode of the hot plug detection.
  */
 static
-void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
+void sii164_select_hot_plug_detection_mode(enum sii164_hot_plug_mode hotPlugMode)
 {
 	unsigned char detectReg;
 
@@ -344,9 +344,9 @@ void sii164_enable_hot_plug_detection(unsigned char enableHotPlug)
 	 * on each individual chip design.
 	 */
 	if (enableHotPlug != 0)
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_USE_MDI);
+		sii164_select_hot_plug_detection_mode(SII164_HOTPLUG_USE_MDI);
 	else
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_DISABLE);
+		sii164_select_hot_plug_detection_mode(SII164_HOTPLUG_DISABLE);
 }
 
 /*
-- 
2.30.2

