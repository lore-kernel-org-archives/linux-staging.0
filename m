Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA52C82
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 19:33:29 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id m8-20020a17090a4d8800b001b4f361964fso273398pjh.3
        for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 11:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CBbnsXy9AytdwcK7KD7eqWz23KQCXfm607WErt+s/w8=;
        b=YT1dcDemSzFd9O1uW30vhm+OyQ/p1cRIyirJn4JK0W/kFlEBcQuk/TzpJHVZkq5fNS
         wq+mnMG61BUXUdKnaX4w7tU777mvBvywNvoncTRML58t2j0O5Qh7tT0r0JzNT9UKnfXu
         QVrJlOcEnjD91zZkyzCzxW9fwzWT+hOCsP8mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CBbnsXy9AytdwcK7KD7eqWz23KQCXfm607WErt+s/w8=;
        b=iq/AGsdHIVXo93pFGUF8jJYzEfcVi2zYSV1NSrLxBs/8rFmEL+amHhl2xCG/vb8MUR
         REeCKhF5liUctzTT9LUpCuhgXJcTR1sg9LdzO9dB6IXDpKKjZojhGytWUPJJwqDa4REQ
         3Rbo/8rydsWHScTnEpNu8YBWD+STiq/SCA3Yf1KLyWB1K5C6H10fQQgjxI07tt/pre8g
         70bKJAIB/xKSzByAEPuFxDfcHqxaWrq1pKtzEgMElmJue4xr6t2s1dt6C6BDvb4snG92
         YgokHfwHNt2sXLJWHdIVCJmQIp1Zj1heWWAMDcn8l9WxaSIUxezSEIm1yMp8v3lCbUgN
         30dg==
X-Gm-Message-State: AOAM533mtDNhu6LyPe0HtS+wTw1AhGZBDG5fC0yzUwsXKdyfXzrZGe7N
	Il2qGCKJeEUUirAvfVrp3RM0Aw==
X-Google-Smtp-Source: ABdhPJx2fb9mz0mAbFZn+FD2eJSxHLxAP1SjXHF+pfPxlkQLg9QD3ptDa3kDXQFXt2uiv3/Yd9ff0w==
X-Received: by 2002:a17:90b:4acb:: with SMTP id mh11mr43583pjb.213.1642534409329;
        Tue, 18 Jan 2022 11:33:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i9sm18509238pfe.94.2022.01.18.11.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:33:29 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Marco Cesati <marcocesati@gmail.com>,
	Joe Perches <joe@perches.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 0/3] staging: rtl*: Check for NULL header value
Date: Tue, 18 Jan 2022 11:33:24 -0800
Message-Id: <20220118193327.2822099-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362; h=from:subject; bh=RkrvzQKXiJGeGVtE4aiiwkUUE4cyJyTqNK6BWHEn6Qk=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh5xYFa0gTnX5Uvtzf7/HRJz2R5v+FHxlvgM4/V6ep /QBzNa+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYecWBQAKCRCJcvTf3G3AJk8KD/ 90HzfwC3mZAlSivVeYDqmcqeDbV8BZ/Si9MVcjeWf6G2ulETwY8bNHV7YwDDq/qXNVtCKkAO/xW08Q TP0Cn7BVOsGdL38qzv58z8HfFbwcKIRsfGFzGZFVdpoOdlkxxiLYrgWxklDCIYIG/U3QH8pfdcmzg6 4Lke60cD+jS1CR3cNr9RHHvHw3eij7T3ZU3WpyAL+BcVHkymv0RyZGHM+0fvtR3VYG+dnGwSH5KlsZ fBsIzAsdWqhUXPq7L4Ub7VZ1Q+Z2bZvZdJsS4hXDPJ6PDAILMx1sNU11VSG4EiAQ7128wj41LA4kPB SnV1mzO6vTRrd2jnUQ1rnarsXZ1po4z1ssimb02Cx1gXeVZjY1g/wb14DWp3mWtGI1wfjVMtf0oC21 qOPcR3h9uYRaU9aNslTeMs8cPoFMqmz1SROCrln3Dnufd8RL+y6ybQg4ZuOpf6EQOWmD2fbfixZ6jU hCFi0VRzXTbGOZv11ebLOz2HUhC/lFtKrNwXi47mbvhJwfSMB+vBs/RdevDY9WVLKYp/4l2fei9Wvl WeHRTFTEH6JZGViwTOM+o0X3NtF+/f7AeihfC7E/WQzg+sFBYxY6rNVFuXfXrEYWXosZMEh2uDaONR w65RKc6jytOxlURjKu/cp9phQhJ1eVb39C0F8z925SJb2t+FocoRvMPnozhQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

When building with -Warray-bounds, the following warning is emitted:

In file included from ./include/linux/string.h:253,
                 from ./arch/x86/include/asm/page_32.h:22,
                 from ./arch/x86/include/asm/page.h:14,
                 from ./arch/x86/include/asm/thread_info.h:12,
                 from ./include/linux/thread_info.h:60,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/rcupdate.h:27,
                 from ./include/linux/rculist.h:11,
                 from ./include/linux/sched/signal.h:5,
                 from ./drivers/staging/rtl8723bs/include/drv_types.h:17,
                 from drivers/staging/rtl8723bs/core/rtw_recv.c:7:
In function 'memcpy',
    inlined from 'wlanhdr_to_ethhdr' at drivers/staging/rtl8723bs/core/rtw_recv.c:1554:2:
./include/linux/fortify-string.h:41:33: warning: '__builtin_memcpy' offset [0, 5] is out of the bounds [0, 0] [-Warray-bounds]
   41 | #define __underlying_memcpy     __builtin_memcpy
      |                                 ^

This is due to various paths to the memcpy() where the compile could
see the destination buffer having a NULL value. This series fixes this
by both eliminating cases where NULL returns were impossible and adding
missing NULL checks where values were possible.

Thanks!

-Kees

v1: https://lore.kernel.org/lkml/20220113002001.3498383-1-keescook@chromium.org/
v2: https://lore.kernel.org/lkml/20220115042427.824542-1-keescook@chromium.org
v3:
 - fix paste-o causing build failures (0day)


Kees Cook (3):
  staging: r8188eu: Drop get_recvframe_data()
  staging: rtl8723bs: Drop get_recvframe_data()
  staging: rtl8712: Drop get_recvframe_data()

 drivers/staging/r8188eu/core/rtw_recv.c        |  6 +++++-
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c  |  4 +---
 drivers/staging/r8188eu/include/rtw_recv.h     |  9 ---------
 drivers/staging/rtl8712/rtl871x_recv.c         |  4 ++--
 drivers/staging/rtl8712/rtl871x_recv.h         |  8 --------
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 11 ++++++++---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c |  3 +--
 drivers/staging/rtl8723bs/include/rtw_recv.h   | 11 -----------
 8 files changed, 17 insertions(+), 39 deletions(-)

-- 
2.30.2

