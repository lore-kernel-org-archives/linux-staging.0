Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7B73FC9
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 22:00:54 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g22so3907912edy.12
        for <linux-staging@lists.linux.dev>; Sat, 04 Sep 2021 15:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UIj4kd16/zrsNXzE8q2OMx4c2eCEJ9nBcH+2bqe0QjM=;
        b=JjrzR21iTp8MOgF2CBiYaE4wx86vRPS31uKTG/O5Xr5sh0iS18qmeNacbK2uPILrNB
         V6z5MuO7OZPoFRHx4ZLB7aY/yr2vLxrsvRonwZTPSdTqUPc3EwajL/rkGeOwGxhnfs60
         4QR/tqHpiU1Dnu1RdJMH3XQUV+/bZvLW9OS+p97vi6Q9RpZLXUnAaqRAHvOGuVxqQPQ4
         iIQGPktEmGYkTda+DYxNXeQiZhk90oC2sSeBnPhx9VZyRLYEdCMNTdaHb0E0qoR0b6l0
         pGw03wV8IKpW7fYQw9xNrHtNbEanhqzoJt61QNMXwo11HgLmwV61OU41lEgym5xKRMEl
         Vzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UIj4kd16/zrsNXzE8q2OMx4c2eCEJ9nBcH+2bqe0QjM=;
        b=IgSu7v48PcUIqd1aMRr13IGv2T88fIhg+svCeKhLufl9B3/SVFJqQ70oZr4pSyDmQp
         aIcGPcaaUTL6KHQD8DmGuoBpifFPmIzFCefeWR0I7veVwjsLbwVXS+N66wgjSjPutmOB
         MGt5rxglBHtnGf3myby4SfSNnkGH3P4G7oee5Td74W9ROYQDpdgazA4YSquqphf8WFgX
         ncYr9LWB+B1JKirNUXO8NsTWemlvwmWPbSfLQqAasO/i4J0S/cefn7QkzO907cWoNGLu
         euPezUF6Yj7XagiZ9++XcWlpfzLFlNU1p4e5iW1TsqIP67qPOdPh4aXEC1dcuf+gfRkC
         OTUA==
X-Gm-Message-State: AOAM531ZWnRlnrDoKSv7jGb7c9SVbaTLzF9tXqAT2PBqhdDczTbEQIVw
	MW+nnggX8i9PHdaoNY/dBGo=
X-Google-Smtp-Source: ABdhPJz9u8FVT5ux1Zgb9U2RGewrl2xapXPVTyS8egz/zYwhx2n8b5Fne3auaV5m9hhxN3qH+WRK7Q==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr5988804edt.219.1630792853287;
        Sat, 04 Sep 2021 15:00:53 -0700 (PDT)
Received: from localhost.localdomain (host-79-23-101-208.retail.telecomitalia.it. [79.23.101.208])
        by smtp.gmail.com with ESMTPSA id i4sm1940258edq.34.2021.09.04.15.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 15:00:52 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 0/3] staging: r8188eu: Shorten and simplify calls chain
Date: Sun,  5 Sep 2021 00:00:45 +0200
Message-Id: <20210904220048.12822-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_ops abstraction is useless in this driver, since there is only one ops
registration. Without io_ops we can get rid of indirect calls mess and
shorten the calls chain.

Shorten the calls chain of rtw_read8/16/32() down to the actual reads.
For this purpose unify the three usb_read8/16/32 into the new
usb_read(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_read() and use in it the new
usb_control_msg_recv() API of USB Core.

Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
For this purpose unify the four usb_write8/16/32/N() into the new
usb_write(); make the latter parameterizable with 'size'; embed most of
the code of usbctrl_vendorreq() into usb_write() and use in it the new
usb_control_msg_send() API of USB Core.

The code with the modifications was thoroughly tested by Pavel Skripkin 
using a TP-Link TL-WN722N v2 / v3 [Realtek RTL8188EUS]

Fabio M. De Francesco (2):
  staging: r8188eu: Shorten calls chain of rtw_read8/16/32()
  staging: r8188eu: Shorten calls chain of rtw_write8/16/32/N()

Pavel Skripkin (1):
  staging: r8188eu: remove _io_ops structure

 drivers/staging/r8188eu/core/rtw_io.c         | 241 +----------------
 drivers/staging/r8188eu/hal/usb_halinit.c     |   6 +-
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 242 +++++++++++-------
 drivers/staging/r8188eu/include/rtw_io.h      |  76 +-----
 drivers/staging/r8188eu/include/usb_ops.h     |   2 -
 .../staging/r8188eu/include/usb_ops_linux.h   |   8 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |   2 +-
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  40 +--
 8 files changed, 174 insertions(+), 443 deletions(-)

-- 
2.33.0

