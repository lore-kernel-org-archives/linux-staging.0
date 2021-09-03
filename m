Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD372
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 09:34:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q11so7290777wrr.9
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TlzU+gYZf09GNOQjPD9zGEE2KldQYdhkiiEAVHNDEWQ=;
        b=CGrd0bqznsxP7FSWjvNvHLsTOIKLX9rjdWcB51Hi3aHyeqcgfGaWhi6tbsohSK8iOy
         v/XyaC1cpw8DyPO59KiMgYJblO2DMlztCdKjvbOICJOPuwV6TJGf3bJkfNeoqGG2XBfQ
         yAD7RBXvfzuymXZkepENmOHu8/CbvAPufp69ddn+YwxPlRvp+lRExfTKCb/QLQVU6+TU
         1BTyhelF0BrxQ9OyreGxhts/BDMkZP0qV+Z4nL7LC1gwVtYRRNkf/JZuxBpYbDxnJfo3
         dI7/w+/jY8TPoNwyrOUbdeqeHhKUOqy+eziNz3llOZgij16oHzB03592ahAl0zo7gA0B
         r4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TlzU+gYZf09GNOQjPD9zGEE2KldQYdhkiiEAVHNDEWQ=;
        b=pzxAjtuMcvVhkQgK5kNny0JnHI3wY29k9D93Mf3ZWW3l6XoRPELKquMrz8Lr0/x+it
         IAo7fLkNOqlbj4Aw42aPJYP4Y99aKqcfYM963FI7gZuJ/qcQItsswAajh63Ftxp1HICC
         UIjOHq9WKXVZ5Ek6i4Wr+Po7eU9dW8ukKhNIK7iOOT7vBWOvzKI8SrXcmwsyxfdiGaYE
         Sz3enJV5UDXNHrg67CXnadb7MykECpDuHm+QuFpVFsBs4MLEhM1VNj5Kfaxs8sVEa4kq
         ZX9Vp7Th7soBbK4Rpsmj93xa176mpewLuXlYS7D24CLogUxnXjIkTrjx9WR/DVlTPBL9
         xhkQ==
X-Gm-Message-State: AOAM531tZnzcA542108JnObGPsWQ7XThmZuJb9D5WQdN3pG417DMn7Rv
	rx+W7RH6iP2JL3GMCAYtg8w=
X-Google-Smtp-Source: ABdhPJxw2lawFWbKPAftblaAweRT8AZHn1P9hUytTYRXJ7eMCErTOn3Z7Mto6ePZYIRrc6hHcTxMSQ==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr2923672wrq.263.1630661647883;
        Fri, 03 Sep 2021 02:34:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm3853060wmk.21.2021.09.03.02.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 02:34:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: remove unused code
Date: Fri,  3 Sep 2021 11:33:48 +0200
Message-Id: <20210903093354.12645-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unused header hal_ioctl_rtl.h and some unused
constants, macros and enums.

Tested with Inter-Tech DMG-02.

Michael Straube (6):
  staging: r8188eu: remove header file rtw_ioctl_rtl.h
  staging: r8188eu: remove unused defines from mp_custom_oid.h
  staging: r8188eu: remove unused enum from ieee80211.h.
  staging: r8188eu: remove unused enum rt_eeprom_type
  staging: r8188eu: remove IS_HARDWARE_TYPE_8188* macros
  staging: r8188eu: remove enum hardware_type

 drivers/staging/r8188eu/hal/rtl8188e_mp.c     |  20 +-
 drivers/staging/r8188eu/include/hal_intf.h    |  40 +--
 drivers/staging/r8188eu/include/ieee80211.h   |  28 --
 .../staging/r8188eu/include/mp_custom_oid.h   | 270 +-----------------
 .../staging/r8188eu/include/rtw_ioctl_rtl.h   |  63 ----
 .../staging/r8188eu/include/rtw_mp_ioctl.h    |   1 -
 6 files changed, 11 insertions(+), 411 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/rtw_ioctl_rtl.h

-- 
2.33.0

