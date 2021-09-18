Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EF53FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:05 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i23so19197362wrb.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BABlzt80sKLlWBbHSQ7YDi+6K9uAMurnOw2NVfaiht0=;
        b=d9su+/S6Jo6eob3J4IW1o3AJi4m7u9Du9xL22hLMPCz4gHD9q1JkfcT89j350fDGI2
         5Y07IDp1AvOW0vRZ339fcwZHIX9rgxl+R4j0QgePnY/tKdXydg91Yn8ZVnQbfstRu7z0
         9eFEer5o4OpIeGX7NTthBbMG1yh6MHhHfPXh6nGEFTIOV2vPf19WRV+B4RgeXuUvAAck
         lJLs2qLWv58KQFXcaMibV9vuhYyhtl5f6dyelgFqBhehcvBzgu5paQvCzNvl5s2m/S0x
         LuiSPsF06hbrD9vE2vJor/j9cvWCyt3AAl66yDowC+kKVbsMAdFhkPbNUewZ1O/UYmWF
         DmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BABlzt80sKLlWBbHSQ7YDi+6K9uAMurnOw2NVfaiht0=;
        b=ZDGzdMj+W73rEK+rbigT3F0lsQHN3CUG7CB/0Ux9k4Ufo73z+1YxN13wuhwH8uNRIF
         mvDybl0la/LD326fuD4j92ikLFjd1v/S6+ovNOGfOZz+gVhkIrUTCPZQHHpsmlW638EC
         OgwHI5d5eh1gKdQWtU2rb7i7LI76uKzQsrBXzGjz/zKBNWTh/Mv04mDLGlm2tKPlDjMV
         T9q0hNaI8ikVM5O30Fv0FqHVLGNyXN3DLO/0z50Vxl0WUvM0CNhC6qm0ZUd65fChsBIK
         eiDn5fKy2Ov40/V8htrWL6hcusW4DrC4MUixTMza7Nz0pJrQyRP6pyi696WGDZp7E/Ua
         grHQ==
X-Gm-Message-State: AOAM5339NRtapQmqFxC2zIAIPvHxa+JDcZO/s7+b7+JRTFn86N3RN42h
	n62WBesluMgx9Y1858mEh4Q=
X-Google-Smtp-Source: ABdhPJz9g0U9lTZYBWCDNfpzCyoWXZYuPjFlxUjhDgcfWCr/j6RgGIx3uuLZn6CsQvDPwtvnStWPHw==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr17020413wrv.112.1631957104411;
        Sat, 18 Sep 2021 02:25:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 00/12] staging: r8188eu: remove odm_RegDefine11AC.h
Date: Sat, 18 Sep 2021 11:24:31 +0200
Message-Id: <20210918092443.8724-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes macros and code that is valid only for 11ac chips and
therefore not needed/used in this driver. In the last patch we can
finally remove the odm_RegDefine11AC.h header.

Tested on x86_64 with Inter-Tech DMG-02.

v1 -> v2
Changed subject line of patch 11/12 to fix a typo.
All other patches are unchanged.

Michael Straube (12):
  staging: r8188eu: remove comments from odm_interface.h
  staging: r8188eu: remove unused macros from odm_interface.h
  staging: r8188eu: remove _ic_type from macro _cat in odm_interface.h
  staging: r8188eu: remove dead code from ODM_Write_DIG()
  staging: r8188eu: remove unnecessary if statement
  staging: r8188eu: remove more dead code from ODM_Write_DIG()
  staging: r8188eu: remove macro ODM_REG
  staging: r8188eu: remove macro ODM_BIT
  staging: r8188eu: remove unnecessary if statements
  staging: r8188eu: remove dead code from odm.c
  staging: r8188eu: remove macros ODM_IC_11{N,AC}_SERIES
  staging: r8188eu: remove header file odm_RegDefine11AC.h

 drivers/staging/r8188eu/hal/odm.c             | 224 +++++++-----------
 drivers/staging/r8188eu/include/odm.h         |   5 -
 .../r8188eu/include/odm_RegDefine11AC.h       |  29 ---
 .../staging/r8188eu/include/odm_interface.h   |  41 ----
 drivers/staging/r8188eu/include/odm_precomp.h |   1 -
 5 files changed, 82 insertions(+), 218 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/odm_RegDefine11AC.h

-- 
2.33.0

