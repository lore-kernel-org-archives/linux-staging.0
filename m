Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3A3FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:03 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g8so54009247edt.7
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pd3SO7CyxaitXaKJCeW0+NN/4NyhM2/5Rd5OZDrCDg=;
        b=TFz20IdmgnOBjIAlIafMLY2JQVvEA1BaCe3GRDMArcNJyag3f2lHl5W/N1CQ931Q8B
         jrLakBdgjbbThd5kWqtuOktjafntIdHMoYBnw2+PXEeUB4qm5MbAVbNengdq6ty47w8f
         g5/TlpCIVQFMU28DdXiOPGxAQf2ZSZn0XHRIt8ymCjEFr2PnJ6J4QwQu+OFcj+M5GYe7
         NRycRFzLR1h5MGyfFIDQEpHogfk+bbZR74ZIbv/MXYiowvw4X1lAF9N5bDvyKvfxHNxa
         Qq+1mLIk7/dUoLCPQLpeA1XJXpON5PDCKsDT0OkUR9Fvdh8l/WDWACjnTfeDJhZulMHo
         wENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1pd3SO7CyxaitXaKJCeW0+NN/4NyhM2/5Rd5OZDrCDg=;
        b=pjo+4tO4+tIhFSWyfftnQKKly2mehDg9yQyAcJpBPIqP+AUp1OFHhj67su0Lgsvbz1
         7ejVeS5ROwp3Gjr2iXFO4mI6FV8EDTVya/FDihNVyOWhpDLOSJdD3TYlzReCw08Fav9I
         5UWwWy/mTN2MjPUeaLujiNbnXshQrPyik+nn4CSDNAwzrl6+VdzUTnD99OBm1THQnc8y
         DGzSje+L+Nm/fou8MEHjVu/ATl9f/I/PfBIQeEX1l2D6Juvzq/BZHiqfF3tVpqaBHnLc
         K4eGdQZr9Ies+XdC7n6TCk+sN6NgZkIWwT85sxwN6kUOb68oynjTCGD7kQEmA/1edfmy
         0k3A==
X-Gm-Message-State: AOAM533r7UeAfvY6I9rix7Nii9E+IuS1ZLqK/Z8P0cum/ixZRyBnwuoH
	CD/CQZr8d6jOD1MjMjLDOO0=
X-Google-Smtp-Source: ABdhPJyIJy265pjxvYgoNg1482Vuy/oAWT637Bw10FtW+dt09e9hx7HqPmcjUYkdmittFK6NjVV8RQ==
X-Received: by 2002:a50:bb09:: with SMTP id y9mr25723721ede.89.1632095642251;
        Sun, 19 Sep 2021 16:54:02 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <david.Laight@aculab.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v8 00/19] staging: r8188eu: shorten and simplify calls chains 
Date: Mon, 20 Sep 2021 01:53:37 +0200
Message-Id: <20210919235356.4151-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

--- Preface ---

This is v8 of "shorten and simplify calls chain". The first 14 patches
have already been applied to staging-testing, so we have been requested
to reset the numbering of the remaining patches to 01/19, while discarding
from this new submission the above-mentioned 14 patches (otherwise we would 
have submitted a series containing 33 patches).

The following commit message is provided as it was in v7, both for the 
purpose of presenting the whole picture to Maintainers, Reviewers, and to 
anybody else who may be interested in knowing the entire design and the
evolution since v1 to the current v8.

--- Commit message ---

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
using a TP-Link TL-WN722N v2 / v3 [Realtek RTL8188EUS] and by Fabio M.
De Francesco using a ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano].

--- Changelog ---

v7->v8 (old numbering):
	- 1-14:
		Patches applied to staging-testing, so they are dropped
		from the current v8;

	- 15-19:
		Split into 19 patches. Numbering reset to 01. After this
		reset, 15-19/19 become 01-19/19 (so we have a total of 33
		patches in this series. 

v7->v8 (new numbering for the old 15-19/19):
	- 1-15:
		Old 15/19 and 16/19 are split into 15 patches (as it is 
		required by Greg Kroah-Hartman) in order to make them
		more easily reviewable and for checking that the logic
		is not broken; no significant changes to the resulting
		code;
	- 16-17:
		Old 17/19 and 18/19 become 16/19 and 17/19: There are 
		no significant changes to the code, with the sole
		exception of moving the acquiring of a mutex before
		the test for "bSurpriseRemoved" being 'true';
	- 18-19:
		Old 19/19 is split into new 18/19 and 19/19. The changes
		are split into a first patch that remove a shared buffer
		and a second that remove the mutex protecting the receiving 
		(in usb_read()) and sending (in usb_write()) of the
		USB control messages. 
		
v6->v7:
        - 1-14:
                Add Dan Carpenter's "Reviewed-by" tag. No code changes;
        - 15:
                Add a list of clean-up changes to the commit messages
                and restore an empty line inadvertently deleted in a
                previous version;
        - 16:
                Add a list of clean-up changes to the commit messages;
        - 17-18:
                No changes;
        - 19:
                Delete an unnecessary test.

v5->v6:
        - 1-14:
                Minimal changes to patch subjects to achieve consistent
                style;
        - 15:
                Fix a mistake in the checks of values returned by
                usb_control_msg();
        - 16-19:
                No changes.

v4->v5:
        - 1-14:
                No changes;
        - 15-16:
                Fix minor formatting issues and use "Reverse Xmas Tree" style,
                according to suggestions by David Laight and Dan Carpenter;
        - 17-18:
                Pavel Skripkin found logical errors in the checks of the
                values returned by usb_control_msg_{recv,send}(), so fix them;
                Dan Carpenter suggested to do error handling before success
                handling, so change the code accordingly;
        - 19:
                Add this patch in order to get rid of the shared buffer in
                usb_read() and usb_write() and remove this field from struct
                "dvobj_priv".

v3->v4:
        - 1-14:
                Split a patch into fourteen;
        - 15-16:
                Add these patches for clean-ups of the code that is going to be
                reused in 17-18/18;
        - 17-18:
                Make some changes according to a first review of Greg
                Kroah-Hartman; furthermore, remove the unnecessary while loop
                and a couple of if' test; handle the errors returned by
                usb_control_msg_recv().

v2->v3:
        - 1-2:
                No changes;
        - 3:
                Fix the version number of the patch.

v1->v2:
        - 1-2:
                No changes;
        - 3:
                Replace parameter REALTEK_USB_VENQT_READ with REALTEK_USB_VENQT_WRITE
                in usb_control_msg_send().

--- List of links to previous versions of the cover letters ---

v1: https://lore.kernel.org/lkml/20210904150447.14659-1-fmdefrancesco@gmail.com/
v2: https://lore.kernel.org/lkml/20210904212719.11426-1-fmdefrancesco@gmail.com/
v3: https://lore.kernel.org/lkml/20210904220048.12822-1-fmdefrancesco@gmail.com/
v4: https://lore.kernel.org/lkml/20210913181002.16651-1-fmdefrancesco@gmail.com/
v5: https://lore.kernel.org/lkml/20210915124149.27543-1-fmdefrancesco@gmail.com/
v6: https://lore.kernel.org/lkml/20210915211103.18001-1-fmdefrancesco@gmail.com/
v7: https://lore.kernel.org/lkml/20210917071837.10926-1-fmdefrancesco@gmail.com/

Fabio M. De Francesco (17):
  staging: r8188eu: clean up symbols usbctrl_vendorreq()
  staging: r8188eu: reorder declarations in usbctrl_vendorreq()
  staging: r8188eu: remove unnecessary test in usbctrl_vendorreq()
  staging: r8188eu: reorder comments in usbctrl_vendorreq()
  staging: r8188eu: remove unnedeed parentheses in usbctrl_vendorreq()
  staging: r8188eu: remove unnecessary space in usbctrl_vendorreq()
  staging: r8188eu: remove unnecessary comment in usbctrl_vendorreq()
  staging: r8188eu: fix grammar mistake in usbctrl_vendorreq()
  staging: r8188eu: remove unnecessary braces in usbctrl_vendorreq()
  staging: r8188eu: rename symbols in rtw_read*() and rtw_write*()
  staging: r8188eu: remove unnecessary casts from rtw_{read,write}*()
  staging: r8188eu: change the type of a variable in rtw_write16()
  staging: r8188eu: remove an unneeded buffer from rtw_writeN()
  staging: r8188eu: remove an unnecessary bit AND from rtw_writeN()
  staging: r8188eu: change the type of a variable in rtw_read16()
  staging: r8188eu: call the new usb_read() from rtw_read{8,16,32}()
  staging: r8188eu: call the new usb_write() from rtw_write{8,16,32,N}()

Pavel Skripkin (2):
  staging: r8188eu: remove shared buffer for usb requests
  staging: r8188eu: remove usb_vendor_req_mutex

 drivers/staging/r8188eu/hal/usb_ops_linux.c | 213 ++++++++++----------
 drivers/staging/r8188eu/include/drv_types.h |   3 -
 drivers/staging/r8188eu/os_dep/usb_intf.c   |  34 +---
 3 files changed, 109 insertions(+), 141 deletions(-)

-- 
2.33.0

