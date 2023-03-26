Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38020E4;
	Sun, 26 Mar 2023 12:18:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i9so5944585wrp.3;
        Sun, 26 Mar 2023 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679833112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd4rewnz5GlJ06k4IoKBrqc8s7fRp6iu2hXRsnNCoq0=;
        b=WZBNlXxuFMOGJNSUl8DwXisSvTn4wUNCZ1YKpnx0fzFfIe1pxgFHbTVZ2VBjY3inMw
         dlPpqiHSbpxpUyYgx9lBYIMHUZiI7ipOLdv/KwMdtiNkV6DXkxKUd8tGeymCRslwmglh
         JIc/qxHPQt5hJlqrQhosEylU+vHRlNQROg4Od1e5T9gW3dGpelrMAnZO7KFezxLqxIna
         qsHFgLc91K0fGNVbCculs17si9t0XoSFcljMlJQs+T4zvPod/DFXK0MRCOQ4AIioFv7q
         D6s4ax287nW6My/oxOMKlSyzwVjEE7GE8dqyvJH33JVQMzpOcBKzD5uFYkZvg2ATo8zC
         MUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679833112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd4rewnz5GlJ06k4IoKBrqc8s7fRp6iu2hXRsnNCoq0=;
        b=J2vtMGUJkh/7ixCOtHE3hTUXitFNXLAhfg2vvyAgrKm/KYVAwbvNlxa+5GTv/8Zmtv
         uqnO9HHdTFOGm55nTvlq+piINNeHzU7B8ComA+Eo97Sp+PCU8+Bj1o836V5xS4dquoy2
         FXnt//pbx239l83h1aVkUZp1MB+fTFU2Vrp7RCTbciI6sikZp+4/GpfbDyNQmWYAPdZ/
         +sNdjZTO/zUgV3/HMPVy+ZDyIqctK5k/wmdG0Isx2gaI1YfWAr1pgZdY3b6Yhltw2yZh
         Wj8crtdZMf7jHPcopmrAmjLFSIcGkI1e3uQVtOZY7xDf0h284QJQf1J6gnkLsdcjxaw+
         e7XQ==
X-Gm-Message-State: AAQBX9dMhXduXvV+FJ9nOOYChRAqy9qxfKCAYjisIJdydw1zZnuwyasK
	hmwi3HaD6wleAFyyFfUDotYR/44xc8YF2w==
X-Google-Smtp-Source: AKy350ZQIrHSK/MQ9ecxe125E2gx6RDqu8jh6q7NAvJnvvLW/AkMqjHr/9zTp8or4nBMx75AOicjCw==
X-Received: by 2002:a05:6000:1b01:b0:2d4:496a:5eec with SMTP id f1-20020a0560001b0100b002d4496a5eecmr6740111wrz.34.1679833111563;
        Sun, 26 Mar 2023 05:18:31 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id d10-20020adfe88a000000b002c70e60abd4sm22740265wrm.2.2023.03.26.05.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:18:31 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: rtl8192u: clean up comments in r8192U_dm.c
Date: Sun, 26 Mar 2023 17:18:24 +0500
Message-Id: <cover.1679831899.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up several comments in file r8192U_dm.c

Changes in v2:
 - Remove the 'commented code' and 'revision history' before
   reformatting the block comments, as suggested by Greg. There is no use
   in fixing comments, only to remove them in the next commits 
 - Patch 1: Changed the description and removed extra blank lines under
   the change history
 - Patch 2: Changed the subject and description 

Reviewer feedback on an initial patch suggested additional cleanup
comments. Link to the first patch:
https://lore.kernel.org/outreachy/ZB2a5zwYpBZ%2F6qwU@khadija-virtual-machine/


Khadija Kamran (3):
  staging: rtl8192u: remove change history from comments
  staging: rtl8192u: remove commented out code
  staging: rtl8192u: reformat block comments

 drivers/staging/rtl8192u/r8192U_dm.c | 206 +++------------------------
 1 file changed, 23 insertions(+), 183 deletions(-)

-- 
2.34.1

