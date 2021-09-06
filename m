Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D42E3FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:11 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id i6so7311668wrv.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxVSICxK8PQP1FYYvNRrNOeSxuOM7OpgcICzexNV9SY=;
        b=CAm2NHed49wvF0JySFhg4iw3OETEskCLBSIXuKa02VEBcTV6iDZddAAM+V3etu5foV
         rrOymaoioPzUFdGE1PW8+2IrZUZsID0VFwkUePHn89dfIP+nHF7WHuKARtQO3Ihsnlit
         rRqeDNPdG0wXt4UaoiiLP6kFf2rlv/eY2XKETDS5F7O2uWgaLbuoYXQ/XILpcRkd4QjU
         7UnPMICW0XvNkjY8KPwTcKA4td29e96uprVX1akE/IF2SRTS5MGLJMgSq3nZxiol09jL
         WaTTHSxIPpgOM/9IGW542JRT2usykql6PbjLq1mrXCQFpwZaQO+tJTr8HIVcLWE+Fupp
         Q/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IxVSICxK8PQP1FYYvNRrNOeSxuOM7OpgcICzexNV9SY=;
        b=Kczcak82sBFvka2tcLYtthPlz1zHrn5i/UUiMfgiug0iuchS6OplKARuAqsLX2cFCg
         StYQejqibT0fZbnE3HGzescQpbipDvUp8Aev/56cxOVZ3WblkNDUNv4xte9+y8/KLJM/
         eDYaEf57cbkPtqjXkz/tfaBHMkTm+g+dzpP95uirZ++oRCgyQJXlcRZ9nScSCoL0Y7i2
         X7M0bNpveTCdB5zriZe14MEGGLhJEm5qRkVAzL5TVvPOqUbW89//pYFkP9AjHoz1hTFL
         E7/FTSImxbspsob/KlmHhJ0w0JBTWwDiyHjpwbdVwQ+3ddNURY0+PHOVE9QGlUzHX5eM
         l0ng==
X-Gm-Message-State: AOAM532AQkgPJEHTWt0ZyFPRizdjpIhwghPjmSfkLEvbKfdNGkCh/oWX
	PQxs+brGenh8Iq0dPpt1bTU3rg==
X-Google-Smtp-Source: ABdhPJyTjsl9TrWGf9NZYJoqGy6BLRSS3pG9D6sm8br50kxyVIs4ozNrPsPPO3LTQlU1BNHY66oQcA==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr10590349wri.396.1630890069653;
        Sun, 05 Sep 2021 18:01:09 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:09 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/14] staging: r8188eu: cleanup unset pointers in
Date: Mon,  6 Sep 2021 02:00:52 +0100
Message-Id: <20210906010106.898-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes all remaining pointers from struct hal_ops that are
never set anywhere else in the driver. As a part of this, it also takes
out the wrapper functions and their callers, given that they mostly never
end up calling/returning the function pointer value as they check for
NULL.

There are two exceptions to this however, and therefore this series also
fixes two potentially triggerable NULL pointer dereference bugs.

Phillip Potter (14):
  staging: r8188eu: remove rtw_hal_reset_security_engine function
  staging: r8188eu: remove hal_reset_security_engine from struct hal_ops
  staging: r8188eu: remove rtw_hal_enable_interrupt function
  staging: r8188eu: remove enable_interrupt from struct hal_ops
  staging: r8188eu: remove rtw_hal_disable_interrupt function
  staging: r8188eu: remove disable_interrupt from struct hal_ops
  staging: r8188eu: remove rtw_hal_interrupt_handler function
  staging: r8188eu: remove interrupt_handler from struct hal_ops
  staging: r8188eu: remove rtw_hal_xmitframe_enqueue function
  staging: r8188eu: remove hal_xmitframe_enqueue from struct hal_ops
  staging: r8188eu: remove Efuse_PgPacketWrite_BT function
  staging: r8188eu: remove Efuse_PgPacketWrite_BT from struct hal_ops
  staging: r8188eu: remove rtw_hal_c2h_id_filter_ccx function
  staging: r8188eu: remove c2h_id_filter_ccx from struct hal_ops

 drivers/staging/r8188eu/core/rtw_cmd.c     |  9 +----
 drivers/staging/r8188eu/core/rtw_efuse.c   | 13 +------
 drivers/staging/r8188eu/core/rtw_recv.c    |  2 -
 drivers/staging/r8188eu/hal/hal_intf.c     | 44 ----------------------
 drivers/staging/r8188eu/include/hal_intf.h | 19 ----------
 5 files changed, 3 insertions(+), 84 deletions(-)

-- 
2.31.1

