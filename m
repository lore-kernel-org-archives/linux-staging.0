Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB866D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:13 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id y32so9078513pga.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DybsWO6cYupTAYK5TY3h7KJtjw7Gu9U9lSriFDUMaw8=;
        b=FdKvOV3IL4dnT5Qd/skievzAJiYmP8mOYgeLLnlq8L9EL4D4WJkv9ydKhfJHdfDcpD
         3mmH7Ir/l5o9MTRgL7OacSM9crrSypLeLHN1TyKvyqucvvP9juoFuXW9fep1pOgnBlj8
         6HM+IH4/WtAUjyAhoJWv1TpXk3OTWDuvCWnBQ77qnw/IIoOOLMx/RoR5k3cOtQVAzs0N
         hgOecVo+7k1TP9tlKQ5sQDHt4BhkQG6cGZIYyB11VhyqLiaQEc9QEXWuocbp2k2gHkkJ
         NUW1A0bUUkKs/ivXH8cT1c13KiHIQZRHTPjvV1wcJ1cYnPNyfF3AT+R4XUZCLsy7lwVY
         jLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DybsWO6cYupTAYK5TY3h7KJtjw7Gu9U9lSriFDUMaw8=;
        b=fBO1vGqCzBLtXInAmqAXdhsiOtc2hG7+3b/VsL9IEpp5UV/4OOeQWFRMvH1WgBYmv2
         OjPJK/Zo+YEEBnaVPY1rjtV8eFqZAt9TLP30cSJ5Fi5vJ63HxwzafZPFJ7VsSTWIU7kW
         NBGg5CCb3sW+uaNW+t7cg3L3ODsDyHxZs4yX7uVLqyyMhOBQ+9qLwA43I1af9nqsIt8N
         y9bdjacxWlQoGkMxNtz1w4kKYWYrhi999jyIvZWBmxjWQReNnA+mxfbBUkY4IaPQqEVY
         Kwt28ZCiwCKyMC1xU0e15aIGo1c7ji6Lp3ZqrOeUuaUN0r1pfVXZDSyhHXYkNVcbyjTW
         L5Dg==
X-Gm-Message-State: AOAM533yBu2giAur/KvoNv3exX0GmtAPlRPirT7uQWEk5hu8mmoIdgCQ
	1N++kcXn3U165Bt+x0cUz80=
X-Google-Smtp-Source: ABdhPJwuyTAC8jxTxOk3Mmj1dDuxKrU16iQQtdWCrgRfJU7JlDZ3fSgVkVL7AJIYC/S1Qw5EZuHKEQ==
X-Received: by 2002:a05:6a00:158b:b029:241:a969:4da6 with SMTP id u11-20020a056a00158bb0290241a9694da6mr1584990pfk.27.1617777373300;
        Tue, 06 Apr 2021 23:36:13 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id mu6sm4115326pjb.35.2021.04.06.23.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:12 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:10 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/49] staging: sm750fb: Remove remaining camel case names
 in ddk750_dvi.h
Message-ID: <2ee5dbf98547860d93d5c72b73ea61991dac0b1c.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for type definitions
DVICTRL_SETPOWER and DVICTRL_HOTPLUGDETECTION in ddk750_dvi.h.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.h b/drivers/staging/sm750fb/ddk750_dvi.h
index 8aee0cdf63a4..d953fb5ab9f2 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.h
+++ b/drivers/staging/sm750fb/ddk750_dvi.h
@@ -19,8 +19,8 @@ typedef void (*DVICTRL_RESETCHIP)(void);
 typedef char* (*DVICTRL_GETCHIPSTRING)(void);
 typedef unsigned short (*DVICTRL_GETVENDORID)(void);
 typedef unsigned short (*DVICTRL_GETDEVICEID)(void);
-typedef void (*DVICTRL_SETPOWER)(unsigned char powerUp);
-typedef void (*DVICTRL_HOTPLUGDETECTION)(unsigned char enableHotPlug);
+typedef void (*DVICTRL_SETPOWER)(unsigned char power_up);
+typedef void (*DVICTRL_HOTPLUGDETECTION)(unsigned char enable_hot_plug);
 typedef unsigned char (*DVICTRL_ISCONNECTED)(void);
 typedef unsigned char (*DVICTRL_CHECKINTERRUPT)(void);
 typedef void (*DVICTRL_CLEARINTERRUPT)(void);
-- 
2.30.2

