Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED8A3FC6
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 23:54:14 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c22so53938669edn.12
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 16:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uDnPnwL+7XkZTxo58W8/NTcNsnLRwxUMFNIfr0Kxy7I=;
        b=pZyQ5qa2TK3BdsKWPDGNS/snLnDRx+5G36Et14fO1W+J7qAjQcZfwx8cqJx1lhvyrS
         4zMttTXdznbO73vVyZ5PE/KgzZ5bsPhQEd1o7l7joZdN8205rTAqM3/k0ogM/FGeSoSB
         jjBzWnuzIisrSEpR6K28rotjJnEOXuvd8Agiiyo4vv3Sx8ONTpoN39BMU319vT1XFszk
         +PI2a/wMce1LXf1OdJv/XcEl8NotZtA5Q0aGwjtO9OZpvM8e2vpBts8nhgLcmB4MKrkb
         BcJk/sK5DijyF/e1jQAIf1GyRgRK6l0rZBfm/V/M7wbUy5BzLObf91UAmyiBA7xhtVzQ
         yZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uDnPnwL+7XkZTxo58W8/NTcNsnLRwxUMFNIfr0Kxy7I=;
        b=oZhdIeak78Lyql8DORJyOLxUxkSaVcMSI+a9xmEj201eVaTzsStXNB2zSu4AouZgsF
         cgg/CpgnqTUEHPDSYsfU2yJhuqc/JlROhr7JhqxkRlzFiziZJWrL/I/TZidpUmDZlzff
         NEfQQhZ0dgR0w4veZr56Fzuvn6KHuVoSMgA9w0dxIUvdbBKkVtTOIR4EEw0gZISQOkC9
         IAm5AT0GyWtgs+mYNhcZ8TwB03MS+frRcpaf2ijwHbHUyfBKhdyjoPv3bdlJCw/KfCyv
         uP7cmNqAwADBCViExnNDCaJZtg+593dUCs+7rnvXNnJj7UHmk/JaisMeTWgsIIM9bhWy
         X8Hg==
X-Gm-Message-State: AOAM533eV9k4cZ8/pHq6Zd1k5Tpa8g4Xc0etG/qioh3IMpYS4KOzElrN
	FKuRT6o18ak3UKbmkwvTY2w=
X-Google-Smtp-Source: ABdhPJzkbdLZxls26VaGH1peQvTKahCXxu7PElxN/zHBV0I+XHit/Sf3dGLtM3BSStpHvgL1cZEU2A==
X-Received: by 2002:a05:6402:2cd:: with SMTP id b13mr26036625edx.267.1632095652780;
        Sun, 19 Sep 2021 16:54:12 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-104.retail.telecomitalia.it. [79.47.104.104])
        by smtp.gmail.com with ESMTPSA id e11sm5353636ejm.41.2021.09.19.16.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 16:54:12 -0700 (PDT)
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
Subject: [PATCH v8 08/19] staging: r8188eu: fix grammar mistake in usbctrl_vendorreq()
Date: Mon, 20 Sep 2021 01:53:45 +0200
Message-Id: <20210919235356.4151-9-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919235356.4151-1-fmdefrancesco@gmail.com>
References: <20210919235356.4151-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a grammar mistake in usbctrl_vendorreq(): "checksumed" =>
"checksummed".

Co-developed-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index fc3da0fbf474..3ca2959f4bcd 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -85,7 +85,7 @@ static int usbctrl_vendorreq(struct intf_hdl *intfhdl, u16 value, void *data, u1
 
 		}
 
-		/*  firmware download is checksumed, don't retry */
+		/*  firmware download is checksummed, don't retry */
 		if ((value >= FW_8188E_START_ADDRESS && value <= FW_8188E_END_ADDRESS) || status == len)
 			break;
 	}
-- 
2.33.0

