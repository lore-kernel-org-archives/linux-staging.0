Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DA139E;
	Fri, 28 Oct 2022 06:35:11 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j4so6799504lfk.0;
        Thu, 27 Oct 2022 23:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=LGKirD4g4sEgrYlAgmBzFtanqc37blQX7pVANXmUEABnGRnY8Gnhu+snFNg0jtcOVA
         YaBIDYN6P3azAhOhFP2VFHhjH++1PB+BLGNftuxPleXdycA4aDS9YOLN+wChsscxxJZg
         1XaehjH+Yv1b3mAd5t6WkH4ESR7jAxsl/sa09FAuHpu+siIrk0paojW8++r4JVrNqFRP
         aJ0JnQadFy9vwd8QTTsYk+wBHMDzXzOTKqknORAPdgI0M1w6Y894G4VPoSlTzMORpha6
         eSyb3DkTxm6EE5lZtO56GyGv4uLxcIoZ1Iayal5BGHfuxU54yU9vYoaHb+Y7EwBeKXvB
         Js7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb7xGr5fuIL0NtgblTv6xk3hHUrL7glkJIQ1IQxfKe0=;
        b=H6IarwXnK8Ei/tR1LPrPQE5VS9aHHoBCxofXaVKEh7PyAyBw4Z34JSrUees5ETd88c
         0o4siIFL1/lZAb3wHuclFV/Pl1c4c3NSrVBfsXRbXxZEkqn9Vvm3WQeeMIiuO4BJjAaB
         DA8wKmHTadp6wLxBx9vUnAvh9dQtnlK+oXvXj0JoCxBNb16f731UDDiT4VxdNCfJuJNx
         aWBIiuROsnUyDlVJmSsRNvvh6arxZ8wyI0v+fD4Bfs37Nwt7gBG5txxmxVMb2vxFjJUE
         BPDIWz/EAuKx7LTyaNthubaLL2a78yqXoeg4tDAh0wuaqU5kJTasje+Z5Y1CiCbtZn34
         0AaQ==
X-Gm-Message-State: ACrzQf2HbIp6Cp3e+V28QDr/e/0EJhzHQlFy7SV56pYEOzXMRCsd/GSz
	7GzQqukrjXEXYx535XEdUbM=
X-Google-Smtp-Source: AMsMyM5ce5Dwx9A9W0LAtuDx5Y8cJ+Ijh5AUsBbrGsXPkOfIY1uAdZBBp/3xYcUPUMibJR8f9HbgFQ==
X-Received: by 2002:a05:6512:3049:b0:4a2:7daa:cca5 with SMTP id b9-20020a056512304900b004a27daacca5mr18575041lfb.44.1666938909326;
        Thu, 27 Oct 2022 23:35:09 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id y16-20020a199150000000b004aa8cae6889sm440210lfj.262.2022.10.27.23.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 23:35:08 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v5 0/6] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Fri, 28 Oct 2022 06:34:59 +0000
Message-ID: <cover.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20221028063459.JHcfkwok3r8RFhpEOJW7N1BpV2OAAlcVFgpl9c72XKk@z>

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

v2: fixed a compilation error found by the kernel test robot and
recompiled the code

v3: tends out the error persisted in the second version. this version is
a correction of that

v4: did some corrections as recommended by Greg KH

v5: shortend changelog comments as recommended by Greg KH

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: refactor code in s_uGetRTSCTSDuration
  staging: vt6655: refactor code in s_uFillDataHead
  staging: vt6655: refactor code in s_vGenerateTxParamete
  staging: vt6655: refactor code in the rest of the file
  staging: vt6655: refactor code to avoid a line ending in '('

 drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 218 deletions(-)

-- 
2.34.1

