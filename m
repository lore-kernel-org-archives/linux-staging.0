Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491E29CA
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:40:08 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x4so6413753edd.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 05:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qM2/IEN+AkA2uS3y4nQykwtyhpicukZG09T/lUhejA=;
        b=EFvfa7U5cFR3alwiybhEPjfgtDFCgIClKD+30qf2LTaGFVrBfvylJStcoAaPeoBtku
         nc8dLfRXwVWTO0eFAdK1UUSKfzUDAqwksimAweIKd3CM5jwWqcWv100XdddfaImxITKA
         ETYc7CrGxUsyfMk/chA99zG8gzjsWAGMOcDvjyaHybaNFuI/MeGc7KEbyhNHQUW7258W
         1zCcSrzt6bwC/L4+KzlfNnyABANhSBbESOdFdeHdUSNxq5X5HCidp64cyNrRQpdXX1oI
         m150sU+GnM7iI5J0EZORZRBN5eCw8D+Cnojztv3ktoAMjjnLAJhpWrZkXTCzxMNANVx5
         THrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qM2/IEN+AkA2uS3y4nQykwtyhpicukZG09T/lUhejA=;
        b=KVBCRNDxYyeX+ppeWin1H9z3hsC/SZqRfZzIH9/urJ1gmFFzxA/l7ChCk7DyIIjsYL
         7WINK2MBt4N/QwiiDxmyltj7qKu0IPrhyCKPLGjzXn9uuSWbQclLjcf2Bar89/h2BPMg
         Kz4CvDKjzYZTpOp2koatv8dEfDYZLmOe23Xr2RfZb1fJbJjWzH6sYJaopsqx/ktpKo5k
         w0xsr3ARtL5sCXeWlEmGynRZHFxEUeZR032krsMeJhAPD2Vxu4GQfqam6lYmZxgqZq0j
         IWk0v6Qq0jj2sjNiiiQon8mor96CkdhSXBqq/aOGyPLMcxO0MTa3W7gHSz3PEFb1HKtD
         dpNQ==
X-Gm-Message-State: AOAM533yedhicgugtY5ZyYum9x66NppJx+Zc0xx/CzCM/Qxas/j+deeE
	NRw+ULoXT8moBRWAD9sUOyE=
X-Google-Smtp-Source: ABdhPJxTaBjOSB9vWQ1708QBNB4+vYEGBm6HcYGzW0A2a2nN/Nr6T0GnQ44DX8tgMokH+QXEdGFg3Q==
X-Received: by 2002:a50:e607:: with SMTP id y7mr17608650edm.18.1617972007229;
        Fri, 09 Apr 2021 05:40:07 -0700 (PDT)
Received: from agape ([151.43.204.41])
        by smtp.gmail.com with ESMTPSA id f10sm1349546edd.29.2021.04.09.05.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:40:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: remove MGS_8192C trace logs
Date: Fri,  9 Apr 2021 14:40:00 +0200
Message-Id: <cover.1617971592.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset removes the tracing private macro MSG_8192C.

This macro belongs to a redundant driver specific tracing
macro family.

Moreover the default behaviour is _do nothing_ as to
activate it, it's necessary to hardcode a DEBUG symbol
definition.

Fabio Aiuto (3):
  staging: rtl8723bs: remove all MSG_8192C logs
  staging: rtl8723bs: remove commented out MSG_8192C log
  staging: rtl8723bs: remove MSG_8192C macro definitions

 drivers/staging/rtl8723bs/hal/odm.c               | 3 ---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 4 ----
 drivers/staging/rtl8723bs/include/rtw_debug.h     | 6 ------
 4 files changed, 17 deletions(-)

-- 
2.20.1

