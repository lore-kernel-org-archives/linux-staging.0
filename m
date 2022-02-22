Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB597E
	for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 08:28:58 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id w3so35036808edu.8
        for <linux-staging@lists.linux.dev>; Tue, 22 Feb 2022 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BrVa7cPF9wijuktD07w20oweh+VJHhnda+u1Tia5Q9g=;
        b=FLFhyccSMFOrGRWGIXbKI+zJfnddI8tO6JPCoSiPS3qH4PO05muN4/V4i1GQwFc9bu
         FzlN2qWBP/exaq5IzvSOW/Hf68jIn0/cvqns6cNyXKC9wxSuqp/9cMfDOyMpAEAS+X9j
         G49OaC/4mJqo4/SYkXBQEtYiXoqaRTfll71uZyqGddNMypYSzfGan2wTIzaoVftFoCDi
         RmFnkaBcp2KJNrz2RO6N3kbkAAMWSGWZgMPIyHG+jAUTUrFcXQcCPlYFs5sU72zr7wIZ
         6xEv1Zo/sDY62dMRNgyKmWlRMXoNSlPSaEx0TPiy1xz0gONi4KzNhAJUZqB7tmrwcbbB
         jGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BrVa7cPF9wijuktD07w20oweh+VJHhnda+u1Tia5Q9g=;
        b=R8OBu946bsB/0WkoJNkvQwdB0DwtD+y0SkyrOYmf3L7HEmEDBgdNmtbbAv7/UjCs++
         7+nwOhJHgvpugh1Zi0sMpp3aZ4URYWO8Pe/nf2hfVqnQTnUe/egd2lQT/T7l2JTu9xgV
         85YWKYLhx8Lr5yHMWyj+ooVg76p9AUutd1DJRuNr9QzN3/yn8dgFISmxJXVoeYYP8TGi
         2Imt/Fy3VFIWsprNlkD+g8BJtkHstujZh8euWp19oqgGTRLVB2Y1smoNOwWj4XRmZMD/
         w/bZr7+6TTVUqswB4CGkqDQz8fGPkMbfxY4+9ujy6HlZElcM/ZHkZ21V2RPyZ1+kySJ1
         PN/A==
X-Gm-Message-State: AOAM5336UK+e5+48a33Fx+aDNEOhp48ZyoLN1tnawzim72KbmC++LBFg
	pIiN/FoMp4C9DJK/DQ3QdSk=
X-Google-Smtp-Source: ABdhPJyZCYCb57qQLcloyT6zXAZ1LdCFSUeTKDT8jl8qwZZLjowEnS/zZtXl/OHJQQm1EP2KmYfNzw==
X-Received: by 2002:a05:6402:2790:b0:412:8379:f248 with SMTP id b16-20020a056402279000b004128379f248mr25227566ede.285.1645518536853;
        Tue, 22 Feb 2022 00:28:56 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id v12sm9831926edr.8.2022.02.22.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 00:28:56 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/3] staging: r8188eu: clean up rtw_rf.c
Date: Tue, 22 Feb 2022 09:28:44 +0100
Message-Id: <20220222082847.6687-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes 5 GHz frequencies from the channel-frequency map in
rtw_rf.c and simplifies the rtw_ch2freq() function.

Tested on x86_64 with Inter-Tech DMG-02.

v2:
Changed the commit message of patch 1/3.
Added a check to avoid out of bounds array access in patch 2/3.

Michael Straube (3):
  staging: r8188eu: remove 5 GHz channels from ch_freq_map
  staging: r8188eu: refactor rtw_ch2freq()
  staging: r8188eu: clean up rtw_rf.c

 drivers/staging/r8188eu/core/rtw_rf.c | 62 ++++++++-------------------
 1 file changed, 18 insertions(+), 44 deletions(-)

-- 
2.35.1

