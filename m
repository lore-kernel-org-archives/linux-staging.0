Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE55EC8
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 19:53:08 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id cm8so15596619edb.3
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sbg/+DLQOR79p6+0YNOkKyiycWb1remk9bmGUAMrS88=;
        b=nB6eDpubZekSnWEMZoKwxePhhcG9rMs3SAxMmF3ISlJI75CHUF/6uf0lLL/mWsDYHk
         YVmGREQa6Estabu/cdARskm3SK33BooecldvQ06A/ebqwMwB/RwJm8twzp8Y0aVkhpvb
         s/scUze/CUwY+bioMTTDdBdSfiDCkV4kNf9bS/sLkhIRtZBa3/K8NXWoY97Hwu3z/8cQ
         JMoRTGmNltL3W9eP/eUmrHV0FGNGUdx61xJCSbKNcRkr5Iq8auzltT28nzL1voYRC7b1
         mk/QqcYBuaH/Ker7sD9BlHUSNAODxKavJukcuQHOzKdu484saLd7rDJwG7y3PAYO0ovI
         ta1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sbg/+DLQOR79p6+0YNOkKyiycWb1remk9bmGUAMrS88=;
        b=LXC40oKEwAC8ipo8VWHGeGAsLDJIh/0+nZQfm9RWxA5VafKbDmS3MFeZVDDvqfx5jp
         mqcZUCryQ/CGeTLHgMuQ6ZL9DQqWbhG5xa8cCvBWaOPhrFNWqG2iMkdpBO+AVe3RwdT7
         S+egts63KBqh+F/KuJa9pO9muPD84SEY0XTYcqtRrbc2NzSH1SbwU+i3pdVvLJvdW6fy
         aViKD5xfzRaQ+Hz+bHktnS8nv4Na2NzI3DdjKjJlP0bID9omgjroHbkV/j8aYWTuLe+r
         f0LjO9f2x9Lay3Fvb+OWZixXYVWwSYTf1BzfGqv2kATemAJAuT3Czfl306ynbeIjD20l
         BKwg==
X-Gm-Message-State: AOAM531ZHqXx1Q4m8DCaQRTfmmO0jya6F5H6ny+yy6Goo/qvgGDtTR3n
	nCl9vM65XyU9sRhPIQ1lRW8=
X-Google-Smtp-Source: ABdhPJzFMIej0zmTKKZnEBObUvSWAGC3nQXLGbfIW7RfGr27tjZJrKBSJicYHuowtwePhpk8M+zQUg==
X-Received: by 2002:a05:6402:c10:b0:40f:33cd:a39 with SMTP id co16-20020a0564020c1000b0040f33cd0a39mr18100681edb.234.1645386786554;
        Sun, 20 Feb 2022 11:53:06 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id l6sm4354376ejz.189.2022.02.20.11.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 11:53:05 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: clean up rtw_security
Date: Sun, 20 Feb 2022 20:52:52 +0100
Message-Id: <20220220195254.11759-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes unused macros and aes tables from rtw_security.h and
rtw_security.c.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (2):
  staging: r8188eu: remove unused macros from rtw_security.h
  staging: r8188eu: remove unused aes tables from rtw_security.c

 drivers/staging/r8188eu/core/rtw_security.c   | 174 ------------------
 .../staging/r8188eu/include/rtw_security.h    | 112 -----------
 2 files changed, 286 deletions(-)

-- 
2.35.1

