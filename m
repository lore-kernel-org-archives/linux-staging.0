Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C785EBD
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 20:30:27 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id hw13so27810331ejc.9
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 12:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=dlG18bj99ERjBOy6kSTcERQdUmxCadRteA/b+q4I8ZA=;
        b=CPG5N4iqjLnPDIkNp+CwkhD3MdeSNJtQfOzDry/tuDfuKF9OMRfCGcw417Q6gNsWE9
         qGQNGO3GfbFqcp8MkJQeGL8c7irF2uSmM/3/2QKb+JK/7nXB8JUoGoJ3Imm3A1Cef2ax
         wuFuVHX3vwFYDrvv0thldfA/sT88umGwBibi7oKXmxj2LmA+M332WeuaB4wEeUrUcS7z
         zDmz1VMi+9zQ6HjrI+0bmL9TMVvWHFy+U5TWRDVyflw2SgDo6uDaX5VpXWZJ7n89oZXE
         LLjIEqrK2pwbgUTvL/omUKLjjCBWmH901WpcICDxIHvwsh6PQgBfZGE6vH8wF5l+TmvM
         11bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=dlG18bj99ERjBOy6kSTcERQdUmxCadRteA/b+q4I8ZA=;
        b=MO/z1LYqBTSEQCVqGd+SfecQaMCETa1QbBuW1PUbBonvynJPpfAHF1i7ULhudZUmCu
         +6kCN8lGBjf1ZoKN5CYDAe0eDgHvarQjLUJn/VIcnEYcApuN2VFrwIoT6ZlMhussv9iB
         TjPxfwZMnxJqCCgl7egHCMIdJC/8PYtBdMK6aDvo8Crr/TLfVDMe6mpXJIxcMozIy8Ci
         QTuIu29sxG2s/iVXbuG4e5paj/hJqlG/Mmiaz8x3cz4/r+vSWjUOV0fjse+rs+4s74UG
         T95uJSkJ8n3APrbaHeBzsUd07r53eoS7vpwFJB48u2DTjIb7LcS07iMsSt9g8X6yOZpH
         DZYw==
X-Gm-Message-State: AOAM533PjK8W42u2HL1cn9pV8VI80BA8HcwLO0QXjFpBfOMKhspPkwMt
	FhmM6pv4UldxagIH1sI67TjL+moAmk4=
X-Google-Smtp-Source: ABdhPJzCg1GsTzm/Y4Fl1EH0/KIQ7cbs3XpyXIVGzX4DHCeE14l1XxWWVjrzo/27U13fdaMQe+OLWA==
X-Received: by 2002:a17:907:138e:b0:6cc:f1aa:a8fe with SMTP id vs14-20020a170907138e00b006ccf1aaa8femr13150921ejb.25.1645389025651;
        Sun, 20 Feb 2022 12:30:25 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id e17sm4467279ejl.68.2022.02.20.12.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 12:30:25 -0800 (PST)
Date: Sun, 20 Feb 2022 21:30:23 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: vt6656: Fix CamelCase, add comments, change
 macro to function
Message-ID: <cover.1645386791.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Various checkpatch.pl fixes as liste below
Tested with device VNT6656G6A40
Transferred this patches over VNT6656G6A40

Philipp Hortmann (3):
  staging: vt6656: Fix CamelCase warnings in mac.h and mac.c
  staging: vt6656: Add comment and change macro to function
  staging: vt6656: Remove ftrace-like logging and unnecessary line
    breaks

 drivers/staging/vt6656/device.h | 11 ++---------
 drivers/staging/vt6656/mac.c    | 14 +++++++-------
 drivers/staging/vt6656/mac.h    | 22 +++++++++++-----------
 drivers/staging/vt6656/rxtx.c   |  8 ++------
 drivers/staging/vt6656/wcmd.c   | 13 +++++++++++--
 5 files changed, 33 insertions(+), 35 deletions(-)

-- 
2.25.1

