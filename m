Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31B3FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 14:28:29 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id d11so44684027eja.8
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yMcyNN7HiHMTjPn985fqINOzKmFYb659Kz/R21GSs+Y=;
        b=jpFaHM/b38XWLVP7EUSG0aHR0u2g52qR/KJ4/xj19QvUI/BGh/8Pd1l0/ndBcWHLHd
         Pw/kukD6RuvDS6AfxeiwbAnKUrf7MDErSwzDPifFKcAyorhTUPXn8e9p3LfMrb3NR1OI
         R/eZua7JFZesoen32e6QrqOt9IlC+7BrvFzgFTTSIWMavvb0u4nIG/koviTCgjNyXF4b
         5MITFtxi5EgWZ4j/aurQxZxZBzJuCEu/cD/lu5r5riX/kP9BMwaFfwiNgxiZJivf6hB0
         znQiNmJYISyE9wkArsG9e2THfCwF/InIWRCGgjWzsv95139uFZHL3bp8ZgbyPULMZ21f
         ObEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yMcyNN7HiHMTjPn985fqINOzKmFYb659Kz/R21GSs+Y=;
        b=JVZmTm+WSva9bXKXUmfNOarpojLWghqSnar7EKXBrGqRIGAhWCFCMgIMbQrOYG8vui
         SNqHDb0MWFBCKplOicMUTxyfrEQPD+6ZFqp5bH6XIEYsdYmZgGaOmZ3myE3iBCLeH6KV
         hK3iBCG+YTBA7eC9j0opHOGYwkCEP5sz6kvmFrOfm/yLBUYrNoB3pLdEezUH9wDqELPz
         rJaQ6r2UE9RRakIGHX+3d8AAU1sy69bakxRP/Ej57w2O/4sfZvgB/h9pj4jz/TTqlwry
         mAtL1pTKgB0xTMzEn/kwQRzdZAUDiW3ROP5dxqwT83MKkjZNhEhUwje3WbwDAp3Ehp3g
         O+tQ==
X-Gm-Message-State: AOAM532QX8IggI/ResWCc/r+Lo+hig4JibVyF+kncYFvcX7Kiklzv6r7
	2I2BGsb8RkU0Wa+mQRvv5jk=
X-Google-Smtp-Source: ABdhPJwxQtG/9GIA0HUWnyfmiW0egIEqfupR1GQYDenzMr3t9XHObXhM0gtMgYI0i9ZQ4/KKAFmInA==
X-Received: by 2002:a17:906:2cd5:: with SMTP id r21mr40650069ejr.435.1629815307688;
        Tue, 24 Aug 2021 07:28:27 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id r2sm11873480edv.78.2021.08.24.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 07:28:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: Use new usb_control_msg_recv/send()
Date: Tue, 24 Aug 2021 16:28:21 +0200
Message-Id: <20210824142823.16845-1-fmdefrancesco@gmail.com>
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

