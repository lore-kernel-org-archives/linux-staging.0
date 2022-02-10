Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8F2F28
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 10:05:27 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id d10so13914850eje.10
        for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 02:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tzUGZXiKrG3vda6RRywObRyVscV1BS6OieKdbSw13Dc=;
        b=ni3CJoCNoERTIgfISz9xr7FEisOgmtdFfM77P97vd3xYaiZ+5iEw6mDqNxp4TygXBk
         QGNBXKJPZa9O/C+G+wB0dJtk7qYeCwkoD/QhCs2HhM+H0EBrWFKPVKXFvXRpevg1zChG
         e4apKMnIKO+tB6a7Cw35m1/KK5FmopkSbFbwOmb7t1/EyYZDaNvns/irXzoRe1Ct3D84
         UvdUiSG5YJdh4Ogp9HIWcL1znZyuN4oBlOHvE0qpOTRr/WxTj8IVqwbrMp621mQ8nKws
         xN54N32R0/9QarBe/1j6soJsnDMp6+ud0ODsKr233QQSmsB1gbgFpkRJl8XohUxxPR0d
         aicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tzUGZXiKrG3vda6RRywObRyVscV1BS6OieKdbSw13Dc=;
        b=nNiU/rk5aKALIYcpwE6YiI6t65z2vGxYZXEkHLuaQsqb7uhPSr/kLL9H8JzwDV5BFM
         BdMUXeTgrxWOq4fOU0qaUKflPGlDPClpBXDtaiTfjvnrFwzdoSxWNsGvoXVYpf4aIzvQ
         BTSjTJ3JMbZIDOCihTdZrZqQo5rU9xlJyGenngWJvHYG6m53iTqKZCCvCzl2UjaU6VgM
         +hFjeO797SQ/90vDnI1vQk73RUyfYoHCsSkQIadq5lRG2250LaX7S2OEFC5FiqU0OMqF
         Gd2aIZxS79u3iLdLDsg7yPQAKq3yIOTCxsvPuIpUjuqhr/Tj/rDyNbgpZsXzX460KzpF
         7WzA==
X-Gm-Message-State: AOAM532VkhWWL2poGsrJY8RHzVZbt5yC5sb+O/P9s3rF6tY1X5ypFSHr
	XOnhCLChlrUxcaiBs6N5gyg=
X-Google-Smtp-Source: ABdhPJwT3mN3Ygn68QfJuEMPQPLIfHRie17zDbi5JuaDQJnsmrjYE+5WzmtYMtSFCcxmS07VYyTJkQ==
X-Received: by 2002:a17:906:4fca:: with SMTP id i10mr5509634ejw.542.1644487526297;
        Thu, 10 Feb 2022 02:05:26 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id 5sm9729858edx.32.2022.02.10.02.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 02:05:26 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: clean up ieee80211.h
Date: Thu, 10 Feb 2022 11:05:12 +0100
Message-Id: <20220210100514.8506-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes unused struts and enums from the ieee80211.h header.

Michael Straube (2):
  staging: r8188eu: remove unused structs from ieee80211.h
  staging: r8188eu: remove unused enums from ieee80211.h

 drivers/staging/r8188eu/include/ieee80211.h | 266 --------------------
 1 file changed, 266 deletions(-)

-- 
2.35.1

