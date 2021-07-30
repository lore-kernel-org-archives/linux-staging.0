Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81F72
	for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 14:54:11 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id n2so13524875eda.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NjK4WEz3AVk1erWrJk/Bhjdi80m8gkUV910wGJeEiO4=;
        b=Ryh/EijDu6Xx/fEpSLSwXJ6ImGC/M/pWSubB4VyuKmqEn3cV+jilQO8IXmoI3rlDdd
         WDs5L3X7YB9Q+vnc+zdri10Dn4XfuZT2aPKS4SFlADLNpCjG6eJ2EM9lGJrM9tpW4eq+
         Ufdl16psWyhSqQkdoHtIqHx/oXz+RyIN+EwaV4olxo2/PuG9XwLzOe4VY8x1WeAYCvIB
         4n0+UAghHgq2kTn3c9lSfBAGL5Aj42ooCwAC+qKJp9CEPx2kWxnXMm7OWqyeBAmkzagy
         /aPsSXkt4RZdedmg6vE9v6ntu4WLRV7C4Xc09qcGA5WMOWNpxUJFnNHxb8hT5AlYqvMD
         IZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NjK4WEz3AVk1erWrJk/Bhjdi80m8gkUV910wGJeEiO4=;
        b=k4MvKFhYA1fakZUqmi+WGwHgoi/nioEr/aINglNvjPv0Ce5KxUD7nrdg6C3TOsjHeT
         J4ni3YAQJoe/XlfvbLkEz+mURA9Tu1JVuLQwY9h+EJK9eZz5YwzGswdV4YdGafgnKAzY
         UgEOOyIj1ftMs5Dc9rNu6aLrG4IO+gVZiCrtqaAPD6kt1VPFBb4nWKL7FzhZviLwEn/H
         Pt9dL07yRJqgLZnsNoqR6livYpcZMJb7Eh+DyU/w6XkiUxh03mZqF49GwShpgnz9rhBB
         sw3YWL0JJVcJd/KN4eRe489RODgSQaFx3nX1+Ixi2rAKMt42Cg6zPgJkIiso3shzegy2
         YXpA==
X-Gm-Message-State: AOAM532sViZHsaOjSK/ywaCl5+6XlVn5ozBOKaOdxwyk/fhqhcnY+gu/
	SsPqu9QByDn7DqnpEJmfHhc=
X-Google-Smtp-Source: ABdhPJzBm3OMhrr4mkBzW/9Q4Ypwxy2UnSxfLxJGY6Q2BTal6iNmZjTRWQriXSo+sI8SQS4ptr8oeg==
X-Received: by 2002:aa7:cdcc:: with SMTP id h12mr3391296edw.39.1627656850318;
        Fri, 30 Jul 2021 07:54:10 -0700 (PDT)
Received: from agape ([5.171.81.215])
        by smtp.gmail.com with ESMTPSA id r7sm808630edd.48.2021.07.30.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:54:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8723bs: little cleanup
Date: Fri, 30 Jul 2021 16:54:04 +0200
Message-Id: <cover.1627656773.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series does some little cleanup

Fabio Aiuto (4):
  staging: rtl8723bs: fix camel case issue in struct wlan_bssid_ex
  staging: rtl8723bs: remove unnecessary parentheses
  staging: rtl8723bs: align condition to match open parentheses
  staging: rtl8723bs: put condition parentheses at the end of a line

 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 13 ++++++-------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c    | 12 ++++++------
 6 files changed, 19 insertions(+), 20 deletions(-)

-- 
2.20.1

