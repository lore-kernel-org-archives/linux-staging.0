Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888083FC1
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 03:53:18 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id mf2so30148052ejb.9
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 20:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqQKMQzM9aKLE/AV7JX15NKKtU4bB+2ssxzTEBc4saw=;
        b=rBKQnYFn1+BEaoVjJ0wAmRympqrX5RU+nrJf2/JPxhprJpJU8GVYWxlxk/z6wyj+9o
         QQStyhQQu2Eq/JzW+W9/uPGLb5+RkF1VwrCst42tB9l6Hwtkede2sFbAf5IQJKL2mPas
         OG6nVZxV+Jx8YjZ5xHKr0Z61TJmG/0I68IKkPNCksl03aDqOgLE/j69EoqUg5H+261IS
         ooAkogG0GnbGWJ1Ac8V5OFkYKAL8HED4eoqzMIzO4OVUO6629eD+V7t9gjTcP2wDxg76
         PerFeDO6al3lLmWLoMAqtwzI6hOg5tFKbipXAWTr01qAM0lESADP4qiT07G8sZ+zsUiK
         nBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jqQKMQzM9aKLE/AV7JX15NKKtU4bB+2ssxzTEBc4saw=;
        b=W+Ahu07EapxMhmspNqbI5dmt88BugUimtMEcXJS9hE2axGtRn2nA1dGVMQEZ7AoaTX
         qaRFQQf/KPePK6GRpWI+1LQsOlIL00tclAwzUA6UJcNNtLn6jlAwvwnJMmPwOhLTkvEZ
         CdMS0hc+x3AZMWnJEG/yjmhz1j2Uo5d+AlIEJ/w5xEJXY/MWdMPoDcVWRA6NX48R84c+
         sw76b45VsgDn7HRvRywANamlX+Fe3Os89e0XgMi0Vg9xB3enVPUfhI0lCB5Kk7yh/d0b
         bqDc6PMXG9EF6f4BMuzCxBJa2nj+okO+FIRKurdVm14iKorB9ojt7DcWnyRQQiijsYQo
         rbJA==
X-Gm-Message-State: AOAM531o74/39MAIaNGBx6rwxcJ/nS0nOUJ12XBvrUVw3F6WVfMCHQi4
	o9VFsB1lP4VfXy/Tou4ZCvo=
X-Google-Smtp-Source: ABdhPJy2H7iDmVmfZOhs8Q35FVERtfHqyoPSrYxjAg6dK8gLe6cg5PtM9EkvEufsNqyY+PFwatRubg==
X-Received: by 2002:a17:906:8cd:: with SMTP id o13mr44597232eje.341.1629863596954;
        Tue, 24 Aug 2021 20:53:16 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id b15sm4326751ejq.83.2021.08.24.20.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 20:53:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3 0/2] staging: r8188eu: Use new usb_control_msg_recv/send()
Date: Wed, 25 Aug 2021 05:53:09 +0200
Message-Id: <20210825035311.8910-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usb_control_msg() with the new usb_control_msg_recv() and
usb_control_msg_send() API of USB Core in usbctrl_vendorreq().
Remove no more needed variables. Move out of an if-else block
some code that it is no more dependent on status < 0. Remove
redundant code depending on status > 0 or status == len.

After replacing usb_control_msg() with the new usb_control_msg_recv() and
usb_control_msg_send() API of USB Core, remove camelcase from the pIo_buf
variable that is passed as argument to the new API and remove the initial
'p' (that probably stands for "pointer") from the same pIo_buf and from
the pintfhdl and pdata arguments of usbctrl_vendorreq().


Fabio M. De Francesco (2):
  staging: r8188eu: Use usb_control_msg_recv/send() in
    usbctrl_vendorreq()
  staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()

 drivers/staging/r8188eu/hal/usb_ops_linux.c | 65 +++++++++------------
 1 file changed, 27 insertions(+), 38 deletions(-)

-- 
2.32.0

