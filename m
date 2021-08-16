Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFF2FB3
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 17:35:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id e19so21512005pla.10
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TChWHj0hKTEFv1sp24LirftPFIQvL4OhiwdiV2nww84=;
        b=Ox891SvXPSjB6iyl3u/eb2rxw/mfCiksEDBVmY2HJs0vUen49+0J2WZHcDQmqSW8/7
         aQwYI2Z3QNk5CfNKdFJjxE2X/yCQlx8EvI6AvMvoThxaCvjzxxTOrMorWUFnrf5yQyca
         b8zSAL/C108L+OOyU2xDHYAEBKfNwB9BgZlGPZY0QtX+YuU86UQME7cpc8ID4q819qNl
         dWotEpaznnJMcrChvJwlobCFXIpegVedMfFHAImeWYeCEFahRLz8APkhtpHDS3CE98Zv
         UBW9Ov0yfDgTUZgpuZ2Flxs77L5rID8+Np7PwLOKWgWBy3l8YZvfO3CMFbzp8NMK3RJo
         t4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TChWHj0hKTEFv1sp24LirftPFIQvL4OhiwdiV2nww84=;
        b=Jo+O1vatcLFVp5USU/3dRLoO/tC/zJnxNdn2M/E/GaOOuAT4w5Op/ZcY94ItN5E0W9
         cc3HqIkrZj8o6aFafX5T86O+02aCdphkdzuc8EqwhZUU/LTnVjNBlwfmnqb/lbVGdCqk
         Iuq0XKrz6N2KgOSO/wz4lPrTiqcD2IQfZzs+0ymC0/a223yhRD8FW2DcEsNf9XhxboFr
         aW7wki576ODFYDEdUu+WGCnyPnko6vbdKfsZNhE9XAvjpFcCpd4kZ0lVCtO5aK/zKXt4
         z6FkhQzC7sBD6yLg+FMhYiSF0qfu2Qp6nSiArELjb56hxCVygJs9mfpfeC9O8Mhe/3Ty
         VS+Q==
X-Gm-Message-State: AOAM532HGbvl+fggOhtl269/vt/t6d61NaIKge2+tn8UcbCoGWxNhFoP
	wr0POB1WZqLmJsGFCzRvM20=
X-Google-Smtp-Source: ABdhPJze7pyGEk4RS1YqLThrWdNpEGkVdlIyleFItKyHjC+DXRCmlMF+t5J8Aeaj/VavbxcG+BMiww==
X-Received: by 2002:a62:ea06:0:b0:3e1:62a6:95b8 with SMTP id t6-20020a62ea06000000b003e162a695b8mr11625262pfh.70.1629135330994;
        Mon, 16 Aug 2021 10:35:30 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id u10sm14030pgj.48.2021.08.16.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 10:35:30 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bjorn@helgaas.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8732bs: Fix sparse warnings
Date: Mon, 16 Aug 2021 23:05:05 +0530
Message-Id: <cover.1629135143.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset fixes the below sparse warnings

rtw_security.c:72:50: warning: incorrect type in assignment (different base types)
rtw_security.c:72:50:    expected restricted __le32 [usertype]
rtw_security.c:72:50:    got unsigned int
rtw_security.c:80:50: warning: incorrect type in assignment (different base types)
rtw_security.c:80:50:    expected restricted __le32 [usertype]
rtw_security.c:80:50:    got unsigned int
rtw_security.c:124:33: warning: cast to restricted __le32
rtw_security.c:509:58: warning: incorrect type in assignment (different base types)
rtw_security.c:509:58:    expected restricted __le32 [usertype]
rtw_security.c:509:58:    got unsigned int
rtw_security.c:517:58: warning: incorrect type in assignment (different base types)
rtw_security.c:517:58:    expected restricted __le32 [usertype]
rtw_security.c:517:58:    got unsigned int
rtw_security.c:621:41: warning: cast to restricted __le32

This can be applied cleanly on next-20210816, and is compile tested.

Please ignore the duplicate of this patchset, I did not CC staging.
Message ID: <cover.1629134725.git.aakashhemadri123@gmail.com>

Aakash Hemadri (2):
  staging: rtl8732bs: incorrect type in assignment
  staging: rtl8723bs: cast to restricted __le32

 drivers/staging/rtl8723bs/core/rtw_security.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.32.0

