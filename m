Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7E87C
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 14:51:16 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ae3fe67980so22457705ad.3
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685285476; x=1687877476;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTBDrtvbwG5vBWWTp3u4n6lRUh0XUADBgJi72l1DPeY=;
        b=KgcjvYCH0v9lluWR0fOm7SBQzLjC/jDMjgj9ba4R0trr3cl3Is+pBREY697oTt/Kz0
         C0KkiOywNiIU4jyfZgsgqBqFfiroRWjiOnT10IOco/VsLFwSkXLH+HlTJr5298IFJrbY
         HUn+iAcIgWxyN9Hzbh9ofEh/xGWDplbbfiulJqpp+wXrwKIe39OE4dMCcvraUTvrtBHA
         awdp+OuRZ9Ak0gVmaYNT4EFkCKrjeAFnMEkN7x/XvFjSzac6Od2h012sH0nVh02SW0PY
         42KJ/8DYM11oM7tmn4aOqEaxYm9JXPOUjvmwAnQAKeVfQR5fIUPomnhodc7vvq9Z7mn/
         G7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685285476; x=1687877476;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTBDrtvbwG5vBWWTp3u4n6lRUh0XUADBgJi72l1DPeY=;
        b=Xb1/jz7ocgqkDPiJVD3vIz/J6jyv92VJ4qQgrBivddtXeYOi+GFUVsR1gY2mZCvsDD
         gNFyurzMO/s1/04OGsK6Z2JNYEZuYUFfjCFbgl/5m5Z6ld7Zzd2yVHcNqQzAhWjNKwVO
         5Dz1uNt0FAbhGJyalgzOt650Kojh3XNM3lT1VpJQouFmTfvFG/7O2wW/27eXZrr7DVTn
         qIf2PY5DcMZj2fmM7cCJ+Nt3j2AWoAoxUIZAaDLzIV/VM3XqeHjJbZk6JhT+AXvgrP4S
         mNBhw0F1j4sQZ/FXbk2TltEGpTcURBlZZxfMzrfC1YFB77hrspT/G2ww2awFkDlU580Q
         1mHQ==
X-Gm-Message-State: AC+VfDwCUCr2N9mLCbHK9to8oc863H9D+5pF6u/YkWXseTDIq0OOK6Ze
	MRCbzAAGo1Q9R2/0gyb/gGc=
X-Google-Smtp-Source: ACHHUZ7m17KPc4HJ7Ql676huTbgjFVHOYqs5IzuDPLICaR9efiaPXroj++Y07JuTlPAvo4pit3FMGA==
X-Received: by 2002:a17:902:f686:b0:1aa:f78d:97b7 with SMTP id l6-20020a170902f68600b001aaf78d97b7mr10776102plg.46.1685285475754;
        Sun, 28 May 2023 07:51:15 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.199])
        by smtp.gmail.com with ESMTPSA id c13-20020a170903234d00b001ae6e271327sm6408137plh.1.2023.05.28.07.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 07:51:15 -0700 (PDT)
Date: Sun, 28 May 2023 20:21:11 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Trivial code cleanup patches
Message-ID: <cover.1685284727.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables in struct rtllib_device to avoid CamelCase which is not 
accepted by checkpatch.

Yogesh Hegde (4):
  staging: rtl8192e: Rename variable SetWirelessMode
  staging: rtl8192e: Rename variable SetBWModeHandler
  staging: rtl8192e: Rename variable LeisurePSLeave
  staging: rtl8192e: Rename variable InitialGainHandler

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  8 ++++----
 drivers/staging/rtl8192e/rtl819x_HTProc.c      |  4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_rx.c           |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c      | 12 ++++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c   |  6 +++---
 7 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.25.1

