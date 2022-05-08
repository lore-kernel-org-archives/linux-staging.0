Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35BE7E
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 19:29:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k2so16752076wrd.5
        for <linux-staging@lists.linux.dev>; Sun, 08 May 2022 12:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=vACEGzkRJywEG4wOyEYIXnA0uAB7czqrj5mo8+dtRsI=;
        b=NXqOl8Jjt5VXx7e5nPBvMGzMCaMUCeDJKoqVqNs9WUoaxUfFlUZwMlJdf9Bu/ADH+N
         5KdH7AJOncehTZBPJOhZiEruft1MDeZH/qHwSluP+4uIIeQ37hJuLeAn1muYKPKK7tSw
         rHX8WDHcLQYdQEU8ZPlZIIpeDKbT7Z3UWmqpGWc2qZObraaNgitidacv06vVy9caZDUx
         TCxcwMqrGIs9d7334OE2tApJ+Et+Mq8XM/mKNxR0iIgk09KZ8wSSqgwIJUGxR8YFETfg
         a3VKgYX6hIki8e3xWK7yIjYXsASBvquJ1kW8GL0F7THUv74uWkd4L15ARa4LQBf1rmjk
         JVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=vACEGzkRJywEG4wOyEYIXnA0uAB7czqrj5mo8+dtRsI=;
        b=utdkE9Y7kCSCmt8qsFW7XbZ2cJ6DgcTkaq3XdVuW1fImsQHodiESARPSF9j4VAwk3F
         j52CwcpyDJ/1ZqTemvZWJElECGEP+TW6lEfDpfSG7arqHcIMNio+CjRwEybTsmYOd0wg
         HElGsypfldW/+H1BashvUQecEb+ZP/+fMFsC+bDk0FPuHK11l5BtQFe28GSuNjzJhr4d
         nsOy1rVxdUYtRpzeWlfIDpZy3E8nr9qQcqFBnTe/ftFgf1jH1Rso2kisJIr78Tl7oMAs
         nPJB5Z4SuaOu0YBvZldjT6ce0jYrfSdNsNqhMgN1S69jc+4NJxvG4IaxpkbwAP/Sxymd
         d1KQ==
X-Gm-Message-State: AOAM533O17X9dUH4eqbEeyZYwo7NgFz4SMjOaPgjOSN+HsGhS4pNwskP
	8HdpDMHz+JSGOoqkP6hSK0w=
X-Google-Smtp-Source: ABdhPJwW9xvd1fc//i/fBbz04HuHkGVeT+ybds2CZjJS3jIdxO0G3A6xdoasQd2ycPmfFej5ZTzSMQ==
X-Received: by 2002:adf:e253:0:b0:20a:f176:d928 with SMTP id bl19-20020adfe253000000b0020af176d928mr11097430wrb.505.1652038190851;
        Sun, 08 May 2022 12:29:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p200300c78f3ed42031f51b0dd5fb7060.dip0.t-ipconnect.de. [2003:c7:8f3e:d420:31f5:1b0d:d5fb:7060])
        by smtp.gmail.com with ESMTPSA id x8-20020a7bc768000000b003942a244f2fsm15012167wmk.8.2022.05.08.12.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 12:29:50 -0700 (PDT)
Date: Sun, 8 May 2022 21:29:48 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: vt6655: Replace macro VNSvOutPortB with
 iowrite8()
Message-ID: <cover.1651957741.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace macro VNSvOutPortB with iowrite8.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

Philipp Hortmann (3):
  staging: vt6655: Replace MACvStart with VNSvOutPortB
  staging: vt6655: Replace MACvTransmitBCN with VNSvOutPortB
  staging: vt6655: Replace VNSvOutPortB with iowrite8

 drivers/staging/vt6655/baseband.c    |  8 +++---
 drivers/staging/vt6655/card.c        | 11 ++++---
 drivers/staging/vt6655/channel.c     |  6 ++--
 drivers/staging/vt6655/device_main.c | 23 +++++++--------
 drivers/staging/vt6655/mac.h         | 43 ++++++++++------------------
 drivers/staging/vt6655/rf.c          |  8 +++---
 drivers/staging/vt6655/rxtx.c        |  6 ++--
 drivers/staging/vt6655/srom.c        | 10 +++----
 drivers/staging/vt6655/upc.h         |  3 --
 9 files changed, 48 insertions(+), 70 deletions(-)

-- 
2.25.1

