Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5D4168
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 18:51:19 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t18so6692483wrg.11
        for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 10:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFdMpcrr9o9bPG0hcRF2a2u7eyMqSDF/03Ew3buL0XY=;
        b=AL0ojshv1OS8C2F6fadtkHbhMfDp2ZswA+Hk7rM05LJ36Z0ssItKQ1H0C0sSZ1ULEe
         U/FUjMbd5oXbUEknuZmmy2lfkDrc2HkgdTgbCO120aEkJaKbbGZ681RgJpnby3qfZR1o
         2kV0yJAmH0BqKNk7/UZYY5VTo2EIRNNE6zGKse2TytJ66W2qzVHwZKq8ifln9y5nmrlP
         xmxIMAdfR7PoHd9GpjoJAqFm3RkOpxGPGgqogXx7fzRnHwkDVnq6HeljiCqm2hk2iPoe
         huvd9KxeFv5wJexZM9aqOp7SHep8sW2UsfMWPbUuSq0ZXLQLRMMbK6iAa/iKXQj8JhKo
         zgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iFdMpcrr9o9bPG0hcRF2a2u7eyMqSDF/03Ew3buL0XY=;
        b=FUE58cE0pC1vsCgu231NiCKvn7Am8J36U14LcT43onXnPZXTU+8/JQoOHVcdJ89QTA
         2PnNJzNmWeHr7T4B2/3BbIT32L1xwtOK+eO90bO02mSNgG9e6xjJJ7VAtAedcX1NyJUl
         rIznB5GzyrbUCLcR4lBcRSJ3lc7CKIoMoBFyM5owp9yDyXVNkiV9zM2uNGXeOMNNjMFE
         M5b9OqUOIIqI/SNwwNj8WJWqayPVQPWx16+Syzfw/BqQGQEtMgTdGYr0GFCsWEvZRNpG
         yRRjOmH06AijGPFbVEtRKUNREIJuVy/LbZAs7UZuOYYPRsbPcy2C7bh5U4inN1Kxynqz
         t4lQ==
X-Gm-Message-State: AOAM532pACKN7YI0XngacaqqJVGxF+T4oz3Fe1H3DtGa7foouatS9MNn
	I9dGrxiONPcuXnVMEnzIEuUpZJyKi0+pwJxt
X-Google-Smtp-Source: ABdhPJw1OVXRodfVy7W+AP+9gCFySfqBPjOId41wWG1DvnpvV0z9Y/10x1NCDkgspwY08+rdBJLUSg==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr3083893wru.256.1640199078041;
        Wed, 22 Dec 2021 10:51:18 -0800 (PST)
Received: from localhost.localdomain (78-128-31-15.blagoevgrad.ddns.bulsat.com. [78.128.31.15])
        by smtp.gmail.com with ESMTPSA id d2sm2456202wmb.31.2021.12.22.10.51.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Dec 2021 10:51:17 -0800 (PST)
From: Ismayil Mirzali <ismayilmirzeli@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	linux@roeck-us.net,
	paskripkin@gmail.com
Subject: [PATCH v3 0/2] Fix styling issues and remove unused code in rtl8723bs
Date: Wed, 22 Dec 2021 20:51:13 +0200
Message-Id: <cover.1640197297.git.ismayilmirzeli@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset splits my previous changes into individual patches to
better conform to the contributing guidelines. I addressed issues with
extra whitespaces, wrongly formatted if blocks, fixed order of variables
in if comparisons and deleted the unused parts of the code as suggested
by Pavel Skripkin <paskripkin@gmail.com>. Apologies for the previous
mistakes.

Ismayil Mirzali (2):
  staging: rtl8723bs: address style guide warnings
  staging: rtl8723bs: removed unused if blocks

 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

-- 
2.25.1

