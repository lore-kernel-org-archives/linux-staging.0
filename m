Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900D72C9D
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 14:36:32 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id a18so21835900edj.7
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 06:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NK1daiMXXe0LeZNqPUiALjw7BMBMV4uzHsm9KMsXtg0=;
        b=gfE1VC/xN1Gf+WwqI7G4ljA87mIcGks2r6mp1MlP+xjVIxDGtuEjrT8VZawygxA0rh
         EE0Mkz9zV5n3GODOlvhMZe6cIukDQNolseuER31yKDxUOgYJl2NK+bCcZzgGjclYXw6/
         6d53AV+18lbON7rYp3fKhH3xUbG1qrfuUYDv3reE+UUmTaJuYRCznz8oYgwjlP2rQrlH
         VPe5zKk1UPb8PeamhhrgnkzyjZLZMMc5o5h1bDSmIO2j8JnXR/cTPaInIjtgp4+JHKaT
         0bJB4bsGDnygiHewyLloczEJ01BwWSix00M583WtKv4N9ll0iKGNqjq/hFxrSJkVf93e
         ZJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NK1daiMXXe0LeZNqPUiALjw7BMBMV4uzHsm9KMsXtg0=;
        b=tJwTV2lSoAQFk3tWTa/U8x3KkPouJ7SuoSpxdAh+wTx9qtX+LovITh7qTVvdaL2g/m
         Sx2BKvDMwmhwxbwGjgpPPjwz/RADviYGJySqSKEemkybCmRTuVp4RZYIivCF+SCdiyqi
         0iQHinZYo/97Mr9X00Fnfw0G+Vx8E2t9xin4Ca3O/+nRR4xzre+VhvOg4bRDEVVWTEvU
         YoGgOG6X5DVVwY5K5AfbGv4HheMvVJu/Z5EWfVpBTzH4Kl90PkTYL3vktaiC6ynfRGDU
         SU3lwAbTU9+2j4+Gvi865Q1pKSwMGuFNo/PO25dfXuKz3Q0e8E/K8r9zwCozZbqNJ0V7
         nTIw==
X-Gm-Message-State: AOAM533YW8SOn5zh5Xf0vYMG2WOl7ySPywgZTq/H0ZZMrqxHVjz7rGNY
	vOkq7MzPHZ727YoVuzm/jgM=
X-Google-Smtp-Source: ABdhPJxrCWNxevTx7Tkga8k6Ujuhdr0bSHNVETc57425UiHlwXlQuZl8hByA3zr9KUI1zLMQ4e0EQA==
X-Received: by 2002:a17:906:87c9:: with SMTP id zb9mr2645803ejb.725.1641566190968;
        Fri, 07 Jan 2022 06:36:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id b4sm1445181ejl.206.2022.01.07.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 06:36:30 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: move firmware related macros to rtw_fw.h
Date: Fri,  7 Jan 2022 15:36:14 +0100
Message-Id: <20220107143617.2214-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves firmware related macros from rtl8188e_hal.h to rtw_fw.h.
I missed these when I moved the firmware code into its own file.

Please apply this series on top of the series
"staging: r8188eu: move firmware loading out of the hal layer".

Thanks,
Michael

Michael Straube (3):
  staging: r8188eu: rename _pFwHdr in IS_FW_HEADER_EXIST
  staging: r8188eu: add spaces around & operator in IS_FW_HEADER_EXIST
  staging: r8188eu: move firmware related macros to rtw_fw.h

 drivers/staging/r8188eu/include/rtl8188e_hal.h | 11 -----------
 drivers/staging/r8188eu/include/rtw_fw.h       | 10 +++++++++-
 2 files changed, 9 insertions(+), 12 deletions(-)

-- 
2.34.1

