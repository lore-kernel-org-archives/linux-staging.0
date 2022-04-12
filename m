Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B523A0
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 18:58:03 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id b24so23462047edu.10
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Uu00i8lAMXsKvesfMLYBDGeZkoj5cycOV9pwempbMQ=;
        b=flrRPRmssxmiyBRsMihagETbQ5IQp2gPA4gEFufe1qAdW9CfT3iMEf0izj2bPtvIwD
         7dV/Uwge7CJJJSVsvqCy4pc7NJKPOQ5zuwehRI1JE/o3+LyMPDvncur3lUt+o8Uhj3ur
         /+/btWwc0ZnhdneH5sN1Tj6D8JXcZ7+uibX6RFzPbGe/S++6ySJuwKPxoFfpvzD8cSRP
         xO3JEkKBX+Mdce0uWqff5/nhCizlz/mFMxAt2Bz+LiEAku4xSKAinHU27ubz7yNeX9od
         s6reYEyrzPaC84iy7f7azmULwA1Kplk/xFzd6xEOpzSYNWicQsxRR82xFSn5s2RZOoaR
         0SZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Uu00i8lAMXsKvesfMLYBDGeZkoj5cycOV9pwempbMQ=;
        b=nkoGzrZsCTCS5/IVkh/pZXCvcH+Wte7aw5mfT2WItPyRw7y8dopQe7zqwh+Y1dGdkK
         jmOTJ0lGcBSoC4fLCLUjENEnjBC+67pmSsNA+ETROQ8+hTXhWgUHaROi3hNPN16odt+z
         tMtLiG3ImWfVXFW8DPXjSTiz3o6n0cByBS/DGpRwFiljIxkKLgxPCccvS5FIwJxP1uCi
         ujboOEiKKLT3z/AmrQoCu1sopxrAybc5X3JJBOkS3X5TRKBPLMIj5OeYVbcSIFx59U4/
         LrOnFBoHq5dtQ6xvNEGaJ5WfYqVCDWBHY6eC/PRXJ1Iq5pppZZQhEPtjfaRwi2dZzGl/
         7lMg==
X-Gm-Message-State: AOAM530+Qvsf/m7NrXQd7p6gG1yH5MD22J39ulCaIC66n6QiJhFdziwm
	I2uc2GG9FYRXXcQAkkj9MhY=
X-Google-Smtp-Source: ABdhPJwzOH8HQiS7B9jA/636/d+uBVP2t2Ne/rfK1YrAlDDueuZAcCxImPriEOQjXBAanafUf2wvdw==
X-Received: by 2002:a05:6402:26c7:b0:41b:7aef:bdf6 with SMTP id x7-20020a05640226c700b0041b7aefbdf6mr40683004edd.210.1649789881649;
        Tue, 12 Apr 2022 11:58:01 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm13443482ejm.103.2022.04.12.11.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 11:58:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: clean up block_write() in rtw_fw.c
Date: Tue, 12 Apr 2022 20:57:48 +0200
Message-Id: <20220412185754.8695-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the block_write() function in rtw_fw.c.

I wondered if removing the part that writes 8-byte blocks makes any
notable difference. On my system it took about two seconds longer to
init the device. So I left that as is.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (6):
  staging: r8188eu: correct macro spelling mistake
  staging: r8188eu: rename parameter of block_write()
  staging: r8188eu: change void parameters to u8
  staging: r8188eu: reduce variables in block_write()
  staging: r8188eu: remove unneeded initializations
  staging: r8188eu: clean up long lines in block_write()

 drivers/staging/r8188eu/core/rtw_fw.c | 73 ++++++++++++++-------------
 1 file changed, 37 insertions(+), 36 deletions(-)

-- 
2.35.1

