Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CBF2C9D
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 08:27:44 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q8so15565828wra.12
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4E8jaiZ7dEeM8qAJaXi8Fcn8hzo1yKBv8Ma6YtpsuIg=;
        b=RlEyiuJG4M5Kbe9dJJ8WpP1wMzQA7sKBi0par8RdgiEoC/2vB6ExHh7HUoiMbw8jMT
         W+evjG4pbiaxw0V94GlMrcj1OtleVO41hbYQ8sw/EORDpderAOi2itqm9H05kwgTL7YW
         jL0zA/wCFZU7tEHWSw71dkEdkZZNVv73JaQY4LFRKX4fqhuZOeXEegXbzQmISZkWBy2U
         xz3IGuJrVC0r1nrJZ1HnbmsMFNfTkbvrtv7eWxYPb8J/0NciymXS/8RryAoO/jiZyCFn
         uXVAwpPNp2vUtsD32BB7wB7huDmsDR0osjQJnLg74a0giFM6TH3sufX2Kc64rWJwszCT
         Ehag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4E8jaiZ7dEeM8qAJaXi8Fcn8hzo1yKBv8Ma6YtpsuIg=;
        b=OwnIGRG26jE1YDmyQY+vEQLfPpKfLb6EIhwVLFNt1DvoiqB8Q+rbvYImTTHoH1dVBd
         l8yO77EnM/TnK+AzwRKf7P23YY4cG5Z5CnmmcRlf2ehqg7D51Lby4POMA83jt+Jjsdpn
         Z0y1ykyo5JHJAQe1PA1iKfJ13CgfzkI/cDU9pNnQnSagcGWGTgsiHQn0ZNwETJj7NCFD
         +kJT3xtSw/dts3Oy33H0i1G05X9YUuf3QNdeGLZbpyg6HSE5nbdNaiGTfNCP0GdoF8Bk
         nY/Vf0MGFkevz7lHHXiBNea4QcTaU2DNvIfQ4piMZRexwWCThhu0Om/TNy7pEBAim2c6
         rbTA==
X-Gm-Message-State: AOAM531iVQOGZxlAtWWqT/q9gCZM3hAuFF6rmCbi9nHfT3b3mDSIStNt
	7MGg1bHQkf8Khb3TXHvPSk4=
X-Google-Smtp-Source: ABdhPJz7iO2/QykfmzMWMYYaO0cxOYQBFMJN0ZrPK6LNDJaBvGx6Z1h3g/n8CcZowWjij9d67eXOAQ==
X-Received: by 2002:a05:6000:1e1b:: with SMTP id bj27mr13678224wrb.648.1641630462689;
        Sat, 08 Jan 2022 00:27:42 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id az1sm964536wrb.104.2022.01.08.00.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 00:27:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: remove some functions
Date: Sat,  8 Jan 2022 09:27:31 +0100
Message-Id: <20220108082736.16788-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some empty or unneeded functions from
os_dep/recv_linux.c.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: rtw_hostapd_mlme_rx() is empty
  staging: r8188eu: convert switch to if statement in mgt_dispatcher()
  staging: r8188eu: rtw_os_recv_resource_free() is empty
  staging: r8188eu: rtw_os_recv_resource_init() does nothing
  staging: r8188eu: remove rtw_os_recv_resource_alloc()

 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 17 ++-----------
 drivers/staging/r8188eu/core/rtw_recv.c      |  7 ++----
 drivers/staging/r8188eu/include/recv_osdep.h |  5 ----
 drivers/staging/r8188eu/os_dep/recv_linux.c  | 26 --------------------
 4 files changed, 4 insertions(+), 51 deletions(-)

-- 
2.34.1

