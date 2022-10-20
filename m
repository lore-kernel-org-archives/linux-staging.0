Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91127E;
	Thu, 20 Oct 2022 02:14:09 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 3so18967200pfw.4;
        Wed, 19 Oct 2022 19:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5N94fzUAOl+Ja3f+p9Lirc4wrF3q7tN7b66toKsjsw0=;
        b=da60Gj9c/cgvFyKZEFh8aFGLUH2ur1pvmBK8/jrnB1odgzr8WUEHNhHU0PKP8p3WzG
         VjNjDz74Ufo8+pC6c42iu8GlNTLx7n+oGy90QoQL8uyUPb9LIVv8dHv8HCfkQ5bdZyGi
         sx61pfAY5xib0OyrO6RW9IYRhp0ZJCX/UwR8nDmuw+j6KGCin7PrU7jm4ETKGMBTeVtN
         tuuXjVtWye2N4FTAENKv5IPJITiMTEGRHvkbqHqHgSQXQv4rynpzI5RqNSe0tP1nroFB
         9z7Hay5YhhYZaMhNQR2b5+FUO8QOAU1+4O3rnrDhJA0iwnX9CrZtlTIPEjsghV0IHwGD
         JGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5N94fzUAOl+Ja3f+p9Lirc4wrF3q7tN7b66toKsjsw0=;
        b=2Oqo0yvJjcXVtjco+t1YqITulD3K7qgcyE1KcIKjcYqrr+8i69ihUS78PqUOiHB9SK
         mDh7t+mhjLBYccueWJaAf6JrC5y77sWzf5WSnjyWW+qo3Sq6zn/aEXvjyOaDv7ys5qhl
         QRUT9MudHm26qFowZ72bWyO0FGMUodjZoAEJjzIT6xk+Rarw8hEv0Tlaj4OWoGSQisfN
         oI3tfYezqZrfYBaEgUkYHcOUCNY9/O5Tchdx89/WeURFbtsNSKlmaQ6PAB3k36CMD0NZ
         qdL/lJgfqHmkvMe/s4qmXq8s/y54Y6yrJVxlzo9dlUKMlNmqrOKsLu+tQVEzQb7LxR1n
         E9Hw==
X-Gm-Message-State: ACrzQf0Z7QGiPsP+oVEPg+DxbIdDP17MN1z5rGnEwNILnhILCJzU69So
	rhBzhNlha6JRyEeb5286/XI=
X-Google-Smtp-Source: AMsMyM5hTKqxlD78BqZ9YYfWEajIHz1TwhkjSjLku0P1swsgSGS4WiVB+AYxvNFiB7kcBEIxXPH0SQ==
X-Received: by 2002:a05:6a00:1412:b0:557:d887:2025 with SMTP id l18-20020a056a00141200b00557d8872025mr11545210pfu.39.1666232049122;
        Wed, 19 Oct 2022 19:14:09 -0700 (PDT)
Received: from localhost.localdomain (192-184-163-51.fiber.dynamic.sonic.net. [192.184.163.51])
        by smtp.gmail.com with ESMTPSA id n18-20020aa79852000000b005631af4ece2sm11942936pfq.182.2022.10.19.19.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 19:14:08 -0700 (PDT)
From: Emily Peri <eperi1024@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Emily Peri <eperi1024@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: clean up driver code in rtw_ioctl_set
Date: Wed, 19 Oct 2022 19:10:50 -0700
Message-Id: <cover.1666230736.git.eperi1024@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Created patchset to fix all checkpatch warnings in rtw_ioctl_set

Emily Peri (3):
  staging: rtl8723bs: fix white space warnings
  staging: rtl8723bs: align block comment stars
  staging: rtl8723bs: remove unnecessary parenthesis

 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

-- 
2.34.1

