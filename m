Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A072
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 08:47:33 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id w14so182987edv.11
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8KA9I3ku/yl5Ro/+/TKxhZayzdnwHZaosfiwgC6DMsY=;
        b=aH2p1upryD2RIC1dblX0fdrnz6rt+9HuDHOmQXeE5jbRMdE1MrHfovK9xh26/feB3X
         /pTHHyAk5O6X18d1qoY14Kx94vQKQ/Ud7AYQRws94n8Av/d9PuoxbXQDBdLnSdo1yp4y
         T54geFZrceVTxhgKv5ErUSXiaLsfQzqWmP70rHkXJTophKbLBEK9ljK319oGStcQWw6M
         v+x7ap56zPlD2DD6f9BHaqOSGybg11w9/9EBeKsmEVxKFQBHwJoXOe8o/YwFU9JV41zi
         GVgh4P5IeuptWpzOe1eIFw+L/yGmXgRP3vRUyNhGNmdxophd2iudyPHCEWlThP/xERVi
         jKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8KA9I3ku/yl5Ro/+/TKxhZayzdnwHZaosfiwgC6DMsY=;
        b=5Gk/pUfwkCZzE5YBFbM3Wfu3ACLf2nWZPg0dIBTRfJuYdNM7Mk8ra0EZg2HK1vruQb
         yYIjfv7JN2vS5IIw4oXg/iWOd6L0CqCIB1IWHk97l5VeLC18TcD+mN1buur07mr9vQTo
         B2lW7sZt2EzrwzO6WrxqBYmxZtIycWLLqNQnOodOlJPRJWZ1AT2X+hWXDA2UY1pFQ8jL
         3ErM0aiVgtXyC2vXzyaoXhJapZwRE9nz6RbFxuzg1meJLnCUlX/RuNTeKit5ra/qupOg
         CzhhjMsu5qI8lXvYPs2cYAdnr8jgJElQUmUy/hm3AuJtxOvmK+EtbufsaO3e84KT9Wo7
         BsCA==
X-Gm-Message-State: AOAM531uSs0j1c1Vnkl9fdDt3LusiYdyLnFfHPltRP6BdLyTU1wiKfam
	9g82+6vAvFNqWK/29Hq/kGA=
X-Google-Smtp-Source: ABdhPJwkForZqW+Edg2xTX2DO37w/ItkWzyt/DO80GVnIPcVj21SpXHQ7SYFPSXQ85tafnE3i3VPwQ==
X-Received: by 2002:a50:d802:: with SMTP id o2mr14648994edj.331.1634892451768;
        Fri, 22 Oct 2021 01:47:31 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.pool80181.interbusiness.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id au26sm3446979ejc.53.2021.10.22.01.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 01:47:31 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 0/2] Remove unused semaphores 
Date: Fri, 22 Oct 2021 10:47:25 +0200
Message-Id: <20211022084727.28035-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two unused semaphores.

Fabio M. De Francesco (2):
  staging: r8188eu: Remove initialized but unused semaphore
  staging: r8188eu: Remove unused semaphore "io_retevt"

 drivers/staging/r8188eu/core/rtw_xmit.c      | 1 -
 drivers/staging/r8188eu/include/osdep_intf.h | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h   | 1 -
 3 files changed, 3 deletions(-)

-- 
2.33.1

