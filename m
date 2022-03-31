Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73747A4C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 21:42:06 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id j15so1960635eje.9
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKD1bQMEvuE8Up33LGpgdo8uQklweCtt7yjePFKMDsQ=;
        b=U32eRLu4vnX3/Y3/RNhdQ76Tdc4z8Xs0aUmiEXtAz/HfttzZkQ55hKUx7Ug6JUnZCi
         r88FFbZRnk5/mmd4F9V1QkSqJ3UdqpeVWaoTIA/UfDbC/aGfAE01DL75DKnHun5b5oM/
         tqfpsmvHJmVldYLkGOfoXZiPUww0wZlwrj4F8bpia2fkk5PzvUVttr9l2QRlMk6HUiE6
         TiAbR6fEWTNJD3QhC6trKnVOcn0eBeF00feVt8299uX45fRg5x9Y2ij2puuOD/uAwEkw
         /8AUwfkIr8v2j8Fn2WJ1JZm4BnDzjoZGzMqRYOvPkJTHJhjiQ3c7r12zBja/l+V2Ojx7
         OaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DKD1bQMEvuE8Up33LGpgdo8uQklweCtt7yjePFKMDsQ=;
        b=dGJLVZkFpU9psr/j/BzNeM3wCCCNnaNGDcAgJJZaefIBB9vF8JwcMU+OWjwc3P5s3a
         9/2H0vwJ6z7TOKNYjvojAMKXw3TQSyJoBZ7M7RJkMiVn643Thp3x1BcYITB/pndPz7RY
         HdeA1IvDvM+zofahr0A/KEdJPHCSFTYBjK6EXRRTo5kNbCZdpdVRvOBeVL5r4lEuzRdo
         Wyl4Q6PjtRCkUBqZVeiZ4WRyR2eUevULtKqTlDx00NFVk8KMxlCOf+2tljUEF7j9aAbo
         7eVcYe3LpSvtkKrbYk02j0uLaWF73iiyrq9qafs6igz5JKyLqLalirDNW62G/WFyxKMY
         sLXw==
X-Gm-Message-State: AOAM530t49QiTwBfbFM6uC/AcUErcvfN4VJEnXvXzTrpwBlzH7zE5ClW
	ZeW6HsLmclIDK2W5nwcG8tI=
X-Google-Smtp-Source: ABdhPJxCE3Li5Ud8OlSvbT5DbLd0bufUXAEx9CtdlnI92CUbZ0itj3evNCa6LpvTaB7gCetu/Y068w==
X-Received: by 2002:a17:907:7f0c:b0:6e1:42ee:3e71 with SMTP id qf12-20020a1709077f0c00b006e142ee3e71mr6841207ejc.127.1648762924781;
        Thu, 31 Mar 2022 14:42:04 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id dn4-20020a17090794c400b006dbec4f4acbsm244387ejc.6.2022.03.31.14.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 14:42:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: remove some 5 GHz code
Date: Thu, 31 Mar 2022 23:41:44 +0200
Message-Id: <20220331214146.15161-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This two patches remove 5 GHz channels from the ch_freq_map array in
rtw_rf.c and simplify the rtw_ch2freq() function.

Michael Straube (2):
  staging: rtl8723bs: remove 5 GHz channels from ch_freq_map
  staging: rtl8723bs: refactor rtw_ch2freq()

 drivers/staging/rtl8723bs/core/rtw_rf.c | 56 ++++++++-----------------
 1 file changed, 18 insertions(+), 38 deletions(-)

-- 
2.35.1

