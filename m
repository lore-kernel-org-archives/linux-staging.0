Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F47F70
	for <linux-staging@lists.linux.dev>; Wed,  4 Aug 2021 00:13:57 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id nh14so550206pjb.2
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wO/UCtLUJfMOPjFMa3FSun6AI/QRILAfUuJo3JZX0fg=;
        b=elUaJCZRN3EO363usLpZzl18/cT4gFkB8vJu0xifJ1pgI1aUrEwF1Aqb+xcIKk/tWe
         F4M9gbUoH/bTNrYPDgLVjcH6VX3wI4WVUnvOTqn9eO7lk4e6C6U6/tJxIq0iqid3CNAM
         tdn+YdjOqgVfxep2mr8/UdSG58R7slkT9E4PRRsAOWYTo2q0Rd7QX5ozV5SM9BQHBSvJ
         //qGYGz0QyfsyHpNbei2+30YDoTYCq3N5jQF7u2VpvXEUnWVXD2u+S6nSgJreV8wS4UA
         aY3W+PYNOCq3f7ehtIHPs2OVTy6sEsbrMdO4174E/NAnxKOYqYeDsx2+ccMiFyU1uZWc
         sGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wO/UCtLUJfMOPjFMa3FSun6AI/QRILAfUuJo3JZX0fg=;
        b=VEeShtC94AGY0XStKC0vq82Nwz61gK/wiZmqY9/y9maKXHoj4i9Ipz+i2IQVtaKm5r
         IOYRIGzKVXK/3dAUNbq+NX/SmoPqHXyt1p8hgc7LNl5cZCa98WZU/jlkTmf3JZrjQ4lk
         uAQN5YPUpxOc975tmerrsuf8CwWWcFN3sRUdharPBVnZwP2A7mgWqpQng946pVEZWfVH
         51HV+rgP1ufmd6tj/iZ6NROi2ivpcSCaI+quM0jbjyIFUiaJhxz/U28vALEWoJFb4zCt
         T8N4kbBkzvopwtUROmmd9mXCh3pLwgloEdMQxE7D2YxX3oGI89zOOGKJMn7loEuMrV6+
         b45Q==
X-Gm-Message-State: AOAM532PqdfpO/9aXGLYjdTFLbo3hWvpk+fewfkR6uxcMpwSJcJ94KjU
	YE1XhEjpWzpuaQjqised2Bc=
X-Google-Smtp-Source: ABdhPJzMNGF6LbiWAOwhuFjMYSP/ZflXBkO7SxTufDjoadatczNXyqXq+8wERU7Xjp0WAkz8gDPfcA==
X-Received: by 2002:a62:e90b:0:b029:30e:4530:8dca with SMTP id j11-20020a62e90b0000b029030e45308dcamr24704562pfh.17.1628036037014;
        Tue, 03 Aug 2021 17:13:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:d90f:f801:7164:b4e6:b90b:c4d5])
        by smtp.gmail.com with ESMTPSA id x189sm382302pfx.99.2021.08.03.17.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 17:13:56 -0700 (PDT)
From: "Scott J. Crouch" <scottjcrouch@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: scottjcrouch@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Remove initialisation of globals to 0
Date: Wed,  4 Aug 2021 10:13:34 +1000
Message-Id: <20210804001335.16742-1-scottjcrouch@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes the following checkpatch.pl errors:

    ERROR: do not initialise globals to {0,NULL}

Signed-off-by: Scott J. Crouch <scottjcrouch@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index b9efc1dfe6c7..a6d3c6fa900d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -111,7 +111,7 @@ static int rtw_hwpwrp_detect; /* HW power  ping detect 0:disable , 1:enable */
 
 static int rtw_hw_wps_pbc;
 
-int rtw_mc2u_disable = 0;
+int rtw_mc2u_disable;
 
 static int rtw_80211d;
 
@@ -122,7 +122,7 @@ static char *ifname = "wlan%d";
 module_param(ifname, charp, 0644);
 MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
 
-char *rtw_initmac = NULL;  /*  temp mac address if users want to use instead of the mac address in Efuse */
+char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
 module_param(rtw_channel_plan, int, 0644);
-- 
2.32.0

