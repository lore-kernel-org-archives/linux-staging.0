Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571575CAB
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:53:51 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id w3so4858670edc.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=hxfDpHx5aBjdPJ7ut0oRiSJJNqXdwJRmBzKw30DQFLU=;
        b=C4W/cvGB1ZFq/B426WjT28e3uwBvSfedlvMqfuKLuIeg2YwKRMk8F84od51Du2DlN7
         mAJI3/widzSOOfHXmjFrqyOkwQFH7xe9e6n93Em7+/l/Kc101oP9O/43FchQtYk3lVGF
         nq/XvgoQjaAnGZxude1NKPPRgcsShhR1UG+NAmiE07Pmz1nmhyL6FjT7772ACNk3Ienu
         nnu9vZfEO8sMoRTscvOlyT9H0TIJ/oRX2azumgVe22wblkZEBq3q+y2NvNmfvuuFQrYg
         ckmIL6nycYulPISHnux/owkecdKI/XsahOA1MYpcYmlyzlfMYt/UOKRl/bTChMMCm46h
         YGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=hxfDpHx5aBjdPJ7ut0oRiSJJNqXdwJRmBzKw30DQFLU=;
        b=MpBl4/duNJn6mEkG8f0aEy4fdtuKxwUTBQ+UURbDIepyjjWhN/JgiboQpC8VV5iYG5
         2b/LPtJMDhgUXvUOYGJKIU46kMoRJCIT8LlhHB6eUORBRZDzdkozI46co18CiHAlua4K
         sGsAPmrmKYq7nDn8aCnXQL/2Vgvh71BazFIb3ELDwv1azMkOKou9ZNL3GeRGoik/IKFl
         ysXZ6f0iY6nTFyoKd1k1ajRGY8thxtWIC6JrKZHmNHondb850pB4xNuF1V+JmdOvJYRn
         j8bpLbAOwb+BVUUYKAfibjMmpUJqF/HPnFA/VtPth4rXlQR3x30kr6nUi+bScARR0gO6
         2xRw==
X-Gm-Message-State: ACgBeo0aFobtpgep8ketDzJwqXsXkxETBEvN9ewEtp71moC2DBOsMqfA
	EZ3lI7pa+AwWjUWBWfIxHW5LMbx9TzKRvg==
X-Google-Smtp-Source: AA6agR5iCwqiQtFvUmlCA4t99JTfX4nJh7lNYQbLi5S34idYBiEekRZTHdrY15vGlnbr9QPbGyq2xQ==
X-Received: by 2002:a05:6402:3323:b0:43d:65fc:8d29 with SMTP id e35-20020a056402332300b0043d65fc8d29mr5558051eda.251.1660899229576;
        Fri, 19 Aug 2022 01:53:49 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:53:49 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 0/7] staging: rtl8723bs: remove dead functions
Date: Fri, 19 Aug 2022 10:52:49 +0200
Message-Id: <cover.1660898432.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some functions in this driver because they are not used anywhere.

Nam Cao (7):
  staging: rtl8723bs: remove function rtw_odm_dbg_comp_msg
  staging: rtl8723bs: remove function rtw_get_ch_setting_union
  staging: rtl8723bs: remove function rtw_odm_ability_set
  staging: rtl8723bs: remove function GetFractionValueFromString
  staging: rtl8723bs: remove function IsCommentString
  staging: rtl8723bs: remove function rtw_odm_adaptivity_parm_msg
  staging: rtl8723bs: remove function rtw_odm_dbg_comp_set

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 21 -------
 drivers/staging/rtl8723bs/core/rtw_odm.c      | 44 ---------------
 drivers/staging/rtl8723bs/hal/hal_com.c       | 55 -------------------
 drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_odm.h   |  4 --
 6 files changed, 130 deletions(-)

-- 
2.25.1

