Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D42C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:24:20 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id m26so12847766pff.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erv7X8fHupjLDtNjEQfgytidk5c7eiZziW1iku1D0Nw=;
        b=dQw69VLIInKb0gwFYsDBmKAVyRgFXju6DntOOVJSBJfuREFbA/P1NeAyODFvXQkiS8
         EQ8Tw0B4PCTgncR6Z6pnTXuW60DaD0m+W79ArXFB2FYZQNxGH68luu5ELcGJUN0Ixyb/
         O/90aGdkNYWW80wVKjmKm81jrcyq/0RRgRUX/9BoNBWN17wEhEkhVG8TNiJRewfzeLh/
         MZcx5cXbQaqwvOg8+R/hlfq0O22KDyVqzyKSVAYOtELW64x6d4dVu1yretKpow0ub8mN
         Sv8IMUwmoy/8APZ59k1GImD/tkXLnUUaZqCio+yBqOTZJSjns066YBBvJ1Ta/LSsvtwf
         Xlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erv7X8fHupjLDtNjEQfgytidk5c7eiZziW1iku1D0Nw=;
        b=RMo+Mr8LT8LRo/75jTvr1hJA+48mkyyTtEKo92aydDouCmRqjFuLbltC1IbnEIbP9L
         EhudziwmT+BC/sgICPMhPN0L+u8kLFNOXS4P3zew/rGN1xs3dWPjFkZPnHTwl0zO6gKV
         x+YNgjs9eFkGOV3PvRPCfZgLwJq3CDTXTQjMcsDZo93KB/Bx5KirMl1/f/iBmDU7ktt8
         3n0zZuWXyVprVXVCx64IUqrz6k2H2hCyhFpuu7ZRNboHs1+knPX+quuU4d/m/GU8YZDO
         lpOxKNkQCRYk/BnSSX1ves4nb0b+5KbZ/c9HJcEPbd1Cw2ynB80J7+io6c6W2Hg8BNP0
         DGWA==
X-Gm-Message-State: AOAM5335Cm+A21ig5RuV3Npg6MhZZ8aaQcq3RTLzfEY26kn2Gzdg3K7X
	rZ6+SRNHEvcEQsR3b2n8I/s=
X-Google-Smtp-Source: ABdhPJxeStzq5jTrKMsEPqpzBcOcXWQhz753i9Sj0JBQY1qBO4HUFeNRgzvfEfW79zi6nvyX8iBpmQ==
X-Received: by 2002:a62:7850:0:b0:44c:5b71:2506 with SMTP id t77-20020a627850000000b0044c5b712506mr23830036pfc.37.1634487859697;
        Sun, 17 Oct 2021 09:24:19 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:24:19 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Kaixu Xia <kaixuxia@tencent.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG 0/5] bug reports for atomisp to make it work
Date: Mon, 18 Oct 2021 01:23:31 +0900
Message-Id: <20211017162337.44860-1-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

These mails contain RFC patches, which are almost bug report and some
are just bug report, for atomisp to work (again). Tested on Microsoft
Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with v5.15-rc5.
Both are Cherry Trail (ISP2401) devices.

I'm still not used to Linux patch sending flow. Sorry in advance
if there is some weirdness :-) but I did my best.

To try to take a picture, take a look at the series I sent earlier named
("various fixes for atomisp to make it work")

The 1st patch is required to take a picture with atomsip (again):

    [BUG][RFC] media: atomisp: pci: assume run_mode is PREVIEW

The 2nd patch is to avoid kernel warning message:

    [BUG][RFC] media: atomisp: pci: remove dummy_ptr NULL check to avoid
      duplicate active_bo

The 3rd patch is to avoid kernel oops, which is almost required for
using atomisp normally:

    [BUG][RFC] media: atomisp: pci: add NULL check for asd obtained from
      atomisp_video_pipe

The 4th-5th mail is bug reports, no patches for these issues yet:

    [BUG] media: atomisp: `modprobe -r` not working well (dup video4linux,
      ATOMISP_SUBDEV_{0,1})
    [BUG] media: atomisp: atomisp causes touchscreen to stop working on
      Microsoft Surface 3

I added further descriptions at the top of each RFC/BUG mails.

Regards,
Tsuchiya Yuto

Tsuchiya Yuto (5):
  [BUG][RFC] media: atomisp: pci: assume run_mode is PREVIEW
  [BUG][RFC] media: atomisp: pci: remove dummy_ptr NULL check to avoid
    duplicate active_bo
  [BUG][RFC] media: atomisp: pci: add NULL check for asd obtained from
    atomisp_video_pipe
  [BUG] media: atomisp: `modprobe -r` not working well (dup video4linux,
    ATOMISP_SUBDEV_{0,1})
  [BUG] media: atomisp: atomisp causes touchscreen to stop working on
    Microsoft Surface 3

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 73 ++++++++++++++
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 96 ++++++++++++++++++-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  4 -
 4 files changed, 174 insertions(+), 5 deletions(-)

-- 
2.33.1

