Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C95168
	for <linux-staging@lists.linux.dev>; Thu,  6 Jan 2022 17:42:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id l8so762036plt.6
        for <linux-staging@lists.linux.dev>; Thu, 06 Jan 2022 09:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VanG3D48kv1//pBO4PWaSBkzRUvZ1tAOIiNLtvht6BA=;
        b=mVgluBj3OIqaTswZrqwBwRoYI80zdmhP9Krluqa6plRv2zdkkhyHbobqNPHM5dZrnM
         MuEJnSUpljvGk6cG6GtaWp44fANwmW4IEp1uLpFLZo+wleHf2IC3EGOqbZW48us055tm
         j16ciaHi8PR1yVyNhQjC+LFGR5tyI6xF3BthbImUaAmEjI5502uaYhgdLQaTtht03UGk
         i1awYUMtLPvJe0u/+PzUwDqVbSUPe8onneS5/xm3vpyF72LZkWZOmshIpUZ4zDmFTDFh
         2Iy5CoM4T7ybwZfCyrd+Md68FmSKol3H9gn/CJyAfj3L/HGdoBsH/jNyGAiuInz1QYV0
         Hvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VanG3D48kv1//pBO4PWaSBkzRUvZ1tAOIiNLtvht6BA=;
        b=vyNhajD+/QoNu54g1HzZ3hY960rgkiI3d+sEILzVN7wg+S9VYdB66P0j/QK3HFEsl4
         XeEJcUdOYRacIMMM2dQotINiT7ymMnpEK7o78dQRpeeonYrLzmnRE35YpAjduoQrCKN8
         DUEjO2/SrJBMUf3WDGtrDBNK4+tgf/aG3UV01eDhDWsPhrnQ6ljHHVnC84NV/hFQCy9X
         kyAfcEqkBlREQ23PmYDnAZIzzaS+q9Qrv6a/XZjmEWcYUHEdJ5rNIjYW7M1pQvk+lrY5
         Vab/wIhhxO5OWdgKia79TWSt5vIAg+P1MuNUU3aMR8XigqRlr2c/H8R1L+aikGt0HJDe
         Qm/Q==
X-Gm-Message-State: AOAM5303/+kYLvQuQXHKHNMH/NodkTNPTP9s2KlLrdfI76SVWm6VZOsD
	1ElmNInfX9X1ABSttAuwtbM=
X-Google-Smtp-Source: ABdhPJzX+S9sGWTDP4J9dbDiFaqhNWKGAYp3sOZpb3Ev3VBk272f3UlznDFl3pRc8jJORC9CVgdIrg==
X-Received: by 2002:a17:90b:1bc9:: with SMTP id oa9mr11260006pjb.241.1641490940921;
        Thu, 06 Jan 2022 09:42:20 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q2sm3415903pfu.66.2022.01.06.09.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 09:42:20 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: r8188eu: remove unneeded ret variables
Date: Thu,  6 Jan 2022 23:11:50 +0530
Message-Id: <cover.1641490034.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes unneeded return variables in ioctl_linux.c,
and also converts functions that always return 0 to return void.

v1 -> v2:

- As suggested by Greg, change functions that always return 0
  and whose return value is not used, to return void instead.
- Not removing return variables in rtw_p2p_get2 and rtw_p2p_set
  as they may need to be used.
  These functions call other functions that do return error codes
  (mostly -1 and -EFAULT) but are not propagated back.
  I'll send a different patch to fix that.

Abdun Nihaal (2):
  staging: r8188eu: remove unneeded ret variables
  staging: r8188eu: change functions to return void

 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 156 ++++++++-----------
 1 file changed, 68 insertions(+), 88 deletions(-)

-- 
2.34.1

