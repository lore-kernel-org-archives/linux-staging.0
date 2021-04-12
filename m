Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3224D71
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 16:29:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id k128so7185423wmk.4
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5yY5T3qXbRwDZwbWFp204Mh6qLEwM+ac+6A7HNtQQE=;
        b=nda4l2RVT64ALFuoKZJlYYidK5Nu9fX9bhaY2jQrnycCcOituFOY+qkIXOXgujWgUV
         Ac+WazIcisX71wBu+bcgbYE545Z6dGP7VDto9Wa4d/VRt18Y4J6HkVZqjX/FNtR2G5IE
         G4pVUwXredBR2co8Mjigy2n+biy7SLYFqdGqxmqt6U/w35F+EwLwV+44L/Gsoq0s2Eot
         vabj4ZzD4pdaati330+S7cLfCl+8vsjDkeBZa3rf4zdqJV4hSdfZKV9bkkV/fhOAum+p
         3dzjTtkA43IEO+LPoxG5gtEmpSLBP9zJguuZy9LlZK9pVglNiZRmVt0xDn9jcGSwDoLG
         mEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F5yY5T3qXbRwDZwbWFp204Mh6qLEwM+ac+6A7HNtQQE=;
        b=ROzny54NWVZ9X8zNr9dQaSk4MyXISQgZ8XZd6Cw/86Vt6uYY/wFZFNEnP7QizlwOpu
         ylb8SzsRRinx12SJpo6IehpA5xfQzm7qJUrB3ANM3qrIY80iHSXF3h8iTekiq4ZYct0t
         D1mHe0Uo+lIADIRhErb/6hn/09jlh5R0Ci3JMaq9oyRUml1LFqI0uZPPzaG3nE6tMsrU
         d1M8HQOwA/gENXOe9IkMjUPyAKitZs0t/GpxXW7JeiLrTvqWw7cGv4Y4D/56GgVCYjln
         C8UFN2GJ2rGkFfNovpBiyuPJlCB/BYrGHrud9TlElt24QR3JZM7B64lMOLy07kt4AfrD
         GmYg==
X-Gm-Message-State: AOAM530jMFAfZhZrCN/9nX/q9m53+e4GUj/MJRj5xD+CXF/fxosFtGkt
	RIcF5cUkg/WMIZR7rrseaIg=
X-Google-Smtp-Source: ABdhPJwrgJ2ya6wkGwUWoDKmqX0jvdukHMLXBIfo/kyrZ3qMewjnV8atKqKAIo7JUaxCt83P7TtRew==
X-Received: by 2002:a1c:4d19:: with SMTP id o25mr27580464wmh.137.1618244988757;
        Mon, 12 Apr 2021 09:29:48 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:813f:b20e:675a:834d])
        by smtp.gmail.com with ESMTPSA id b5sm16786524wri.57.2021.04.12.09.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 09:29:48 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Cc: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: hal: Rectify with Linux kernel coding style
Date: Mon, 12 Apr 2021 17:29:35 +0100
Message-Id: <cover.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset rectifies the file Hal8723BReg.h with Linux kernel coding style.
The issues were:
	- Space before tabs;
	- Extra blank line;
	- Indentation problem.
 

Beatriz Martins de Carvalho (3):
  staging: rtl8723bs: hal: remove space before tabs
  staging: rtl8723bs: hal: Remove extra blank line
  staging: rtl8723bs: hal: Correct indentation

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 421 ++++++++++----------
 1 file changed, 208 insertions(+), 213 deletions(-)

-- 
2.25.1

