Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538A67B
	for <linux-staging@lists.linux.dev>; Tue,  1 Nov 2022 22:25:12 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id i21so23807236edj.10
        for <linux-staging@lists.linux.dev>; Tue, 01 Nov 2022 15:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y0TtHVNR0Zt2jBbXANXyzyZbG58TNvz96BB5dak+Do=;
        b=XTD1f7Yp1DKCBTkuRWo2+SvHQxYrb6N1nL03Lr76IqyAxIsPcJtgrsAxq8dokZGxpf
         Pf9aHTVUu2ry1awbP1Nk2Tqva0NMyq+Ml5AYGTbrIpKoHESdjVoPmwey/OJylxbSRT49
         Y316EdFrieSqTgP2uWz+rihiXkVtjpne1MrcZCmVCSrOQ85Fn4rDAJvyIj73YylwcqmI
         NKj6zuvvBoK0w9rr09a1yjFrTnQLW3eYtj2kxVIUYKA0Led89We1MY1E+wVhMUoKF6vo
         GQjS9Q7k+1TMAOx4/tKUwkMPH9gJcNhX4vvr8wmKPiMpqIhFTBqHbEjDdB862qAjf/YS
         pcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Y0TtHVNR0Zt2jBbXANXyzyZbG58TNvz96BB5dak+Do=;
        b=Pr+a6y4Od9I2G+tAFWqPy7c/iKZUA9LQqlRr6fv+ztKs3FqHQDCcqi/l1bOGNCJaka
         pAgPeTYjOY06gTVPfuhXM3L7T2WUputyTag+uVknJpbwwyJ81hxgh3RRU1jTVQZnMcVh
         xCqaSqADwhDx5/WZuOR6gcVW6CJk5g8XdSMOq9sW1SdvaKQP7tEltjc186JxltbpqGHQ
         q7GMAviXxAjcA7vRIV9hjYz8eYo/SnflAPxLdiwslDI0cEh88S4yDLt3XM0SYxwEh2Oa
         SezPbrrDklNZBgbmRktlNvHmtU+tCDM8xBTCoiUy7y/ckrEhrCCMCcewIU2UkgzaEUx+
         QSaA==
X-Gm-Message-State: ACrzQf0QvEZYBm2uL/TZAMUkPUPuqos9NQsNmvIUg/SrRLmoovAO87Ap
	nWPFHQGec11NWeWaVKAvLig=
X-Google-Smtp-Source: AMsMyM6LzPa2RCiNmCR+IRBXvZBNmChmGLbhjGBuWPneabK4epdnsZKYenQf3jxpNORYfuMBLkXSeQ==
X-Received: by 2002:a05:6402:51c8:b0:462:3e90:aef with SMTP id r8-20020a05640251c800b004623e900aefmr21986115edd.225.1667341510532;
        Tue, 01 Nov 2022 15:25:10 -0700 (PDT)
Received: from ZBook.localdomain (86-90-194-80.fixed.kpn.net. [86.90.194.80])
        by smtp.gmail.com with ESMTPSA id z20-20020aa7c654000000b0045b3853c4b7sm4964843edr.51.2022.11.01.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 15:25:09 -0700 (PDT)
From: Jerom van der Sar <jerom.vandersar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: space formatting fixes in rtl_cam.c
Date: Tue,  1 Nov 2022 23:25:09 +0100
Message-Id: <20221101222509.4596-1-jerom.vandersar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f391a7cd-e57a-0643-1ba1-c859bf2f83a6@gmail.com>
References: <f391a7cd-e57a-0643-1ba1-c859bf2f83a6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/1/22 23:11, Philipp Hortman wrote:
> WARNING: Unexpected content after email: 'Jerom van der Sar 
> <jerom.vandersar@gmail.com>.', should be: 'Jerom van der Sar 
> <jerom.vandersar@gmail.com>'
> #14:
> Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>.
>
>
> I cannot apply your patch.
>
> Bye Philipp

Thanks for the catch. Will fix.
