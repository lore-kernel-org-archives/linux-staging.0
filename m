Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924C3FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 22:37:57 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u14so15340202ejf.13
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HOYcVK/PupAyTSKG1WTjWKuz7jMiHsuJ9l66S9C5qRA=;
        b=JAwss7mvORNTFGBLkoY9g43fQPYGr3ycyfLGXxfn7xE3u9LJd0Om8h7ZBOEYwZlnxJ
         zl5q6w9qBVc9TafdeCB9vyJIfF//IC3ZDe2L3q3SmXwTObtLYR39ya+tDed2/ojL77EB
         SUP7QkeaygGjtgPZ5xwX3xSo2GBiFb0WLRTah2JOS0v9y1L4y8jkTiuDHQdOnDfgRM4n
         HcSTzVbzum+xll2CKCRcIM9/AAEZwIaq0vlH5STVg9lo/3wJR7aJqi9uPzjDKhdPrygE
         LpYtpkUYW4WyWWPDwaZRdtKvn5q6zKiw5k2nxlXDWvhO40BCY/ys2Lja6N5Eo63pvc7R
         cU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HOYcVK/PupAyTSKG1WTjWKuz7jMiHsuJ9l66S9C5qRA=;
        b=a8wvrMbD7AvUtCBZzkDJTp75ttTyVwCaw68XmpNFl/FEPhqW8ZAsU0Lj613IYJy9HU
         CjSF95osL97vWwRxwra1yarXCLNnqyqul28TR+E2a/LmOgUgmeJ09HROW2d4sTFSoTZ/
         qw84C/pZS8DNfvgLidIYf1KoQNE8fBOLEY7J7gUJJQcn8S7dtx8LvoVK2gV/xkYNJp99
         LuqApXXmcU7+HeNvt+QoQBw1EElbo85JTxGlI64Hgdml7lAt22yRNmvvE6h2br8ZwwyO
         XpSqX2wcT0uq7oHC3wXNjBjD8eyK05WI4rvso7Jid+mf9IO5ow411nToZ4AkSv3Jkhde
         0IgQ==
X-Gm-Message-State: AOAM533/SCoJtu6dbVquxfypyz3KOsssMoehKTNdUoh3JzotdkIuTs3z
	E9Wl4665OcrqjmpmeaIDZ6o=
X-Google-Smtp-Source: ABdhPJzY4IP/gXljzfMWbFVxvhGjRPLlCusx5kZeSANDKiketNr4ICaOl80ARKH8Qmwvrp8ibJxNRQ==
X-Received: by 2002:a17:906:38db:: with SMTP id r27mr38758558ejd.338.1629758275713;
        Mon, 23 Aug 2021 15:37:55 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id p23sm10375326edw.94.2021.08.23.15.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 15:37:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: Use new usb_control_msg_recv/send() 
Date: Tue, 24 Aug 2021 00:37:49 +0200
Message-Id: <20210823223751.25104-1-fmdefrancesco@gmail.com>
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

Remove camelcase and the unneded initial 'p' (for pointer?) from 
the pIo_buf variable and from the pintfhdl and pdata arguments of 
usbctrl_vendorreq().

Fabio M. De Francesco (2):
  staging: r8188eu: Use usb_control_msg_recv/send() in
    usbctrl_vendorreq()
  staging: r8188eu: Make some clean-ups in usbctrl_vendorreq()

 drivers/staging/r8188eu/hal/usb_ops_linux.c | 47 ++++++++++-----------
 1 file changed, 23 insertions(+), 24 deletions(-)

-- 
2.32.0

