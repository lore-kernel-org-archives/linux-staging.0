Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7BB33EE
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 15:06:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id fy29so13051316ejc.12
        for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VsL98Lrs98Wy38pw5pkmOgCJAyFL+RwwzHJiWxEvQRQ=;
        b=iJAOKYO34qCePC3M1xT48SeEo0Edz2Cz0mC0NEJXVTy1qBZggD1UmHK1z9ZLXd+2Dc
         TxWp9pJAVZHL68yMax9WuXOegSieaKwxo5auKVyZaTIOdyeSAMOAIWP0JxLA+igLA7BF
         sZ9B3WyAOU8bDmGB5gZWdy0DOfmtbr/zaE2waxZzRYK2B+nM7D9/Pvq6JEluFj7S6xMT
         52pzUSaxtMITmfLcwsnnoW7vNWzvOhRbejPcdS/QtCBHTX6xddiZMSYkzl18lX0XZ+V7
         Uj39htufud211Ka+liB7qnL/qfD3nyeRJTi7Kv5rHg+d+K3beU0msYEnQHIj4fast+cO
         qOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VsL98Lrs98Wy38pw5pkmOgCJAyFL+RwwzHJiWxEvQRQ=;
        b=wvokLMkCFt1rQSUO2AV7VEXfs5YXHVGZzRsoVr6qU8epj+BbukfrarODJoL3gOTMRQ
         RFRupZ8fNWB40Ia1MM6ml0fVcLoMBMxlU8t7/Kk3dlFVfmjujxCkx0MsF6bIdiuk6h/a
         I5ZxFh63g7E4Cy9urETl6NrlqGH12yTLBn/ck9ZfWmxl5sYvBEB6LSrtcSqyY5ZNgchO
         yXJe6I7hJBebMKz2sOcu9b7Jcd6UVHv/NgPMdJQhvm6ozpFz6u74bWidCwedDY5ID5/7
         FTaWhifwwB1kj/byRloGF/5pzTxiuo4alg/r07ZVc8otsFDldnOD9vyfM4Ngdqn7tnWn
         gnaA==
X-Gm-Message-State: AJIora+yEkNaoQWpcCQzcQC9/C9a2btPyXeUnvLjcU2+PnFyctyKVuBG
	USC7L7p9X6LiessENMYtwFg=
X-Google-Smtp-Source: AGRyM1unkIJ9uUdveVgDU0EeiIYPA/8KEn6ZCbM6LKRyh6dzQzN8tH4rAY2//VQwdUMPheVaeo9nIw==
X-Received: by 2002:a17:906:8a44:b0:72b:3bba:e867 with SMTP id gx4-20020a1709068a4400b0072b3bbae867mr6659970ejc.752.1659193608211;
        Sat, 30 Jul 2022 08:06:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id sy13-20020a1709076f0d00b00722d5b26ecesm3013989ejc.205.2022.07.30.08.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 08:06:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: clean up dump_chip_info()
Date: Sat, 30 Jul 2022 17:06:35 +0200
Message-Id: <20220730150637.3550-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches clean up the function dump_chip_info() as suggested
by Greg Kroah-Hartman and Joe Perches.

Michael Straube (2):
  staging: r8188eu: convert dump_chip_info() to use netdev_dbg()
  staging: r8188eu: refactor dump_chip_info()

 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 37 ++++++++-----------
 1 file changed, 16 insertions(+), 21 deletions(-)

-- 
2.37.1

