Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6872
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 20:09:37 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id bo19so28199480edb.9
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eoqcCHvcgFjYOwCf/rRzWn/RIeAjZ2LdPjbgucACr2k=;
        b=l4fkPsSkbvhdAWPUaxEovtAuFsvKk8qqwIS1BRiysxH1Bj0yc9D+pNJNd4f8rRDSJL
         rIJ5RAlV1mw90U3WVwRBIGDDXz4Z7DGZQyTZzXGPw6gjrjlJQLAvnLRMMYRXSd9o+3mw
         1lA5USWdCSvMZcaGxALf5/tfOpY22LtECnpTQ4xMI1fApK6DGjD0nVMVXlnvoo0ea1pe
         ARRu+qfg6F8ZUZvKVYl/MPdl3Jp00KzirpORqJ7ZUM+sBXEiaCRAY2BqDjGZ6PrVW37d
         SROq16Wrn/bCQa8R2GfbSI+l2ipJ0hEK+RUJBLW/lenEhAP77eA9FxoEaEOx09H+0Q+Y
         MjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eoqcCHvcgFjYOwCf/rRzWn/RIeAjZ2LdPjbgucACr2k=;
        b=qdx1we9Y/DdnoFbgUcIH7uw7aapRs2X304gAEFKzIFguBotGuYsSCnjEUJ4hN4UfJD
         47kn4fMdInnTEGsPp6f20FCsovJoX/GygjTnAyzc6WowM37LD9bikdmIq6j92G4Lq/0D
         2ncJjQkMWb0jkMFrbkWauKSScmLtHcihNJDZmQynMdOzqbjDg12BT4mH4woyjtNpqnpT
         3PAF3vE7Y3afnCP0SzlqDmNRP7TReSBOhS7PzkU+gDO6v/pT1SkI47TYZ5QP/GdOMdao
         7eSbuhcrvwNWRnCo61LMH6eLWQrJOqv1cpocuNjnn7sFiJtFK6TKKNMy9PERJ3HtI3pj
         2TtA==
X-Gm-Message-State: AOAM531WGdDAVFMmp43YxXA2iG45ZVXLzQuydJk5KXRMdJr4hs3RAzte
	JvbyECx8tYH3Sd3KsncfDXg=
X-Google-Smtp-Source: ABdhPJyi0eg88s7YYQlUZB20e5s7OeQLsiLpWO9toBIT/tHKeoGWYR1pxwxb6+4WmWIbjZah7n1Mbw==
X-Received: by 2002:a50:ef11:: with SMTP id m17mr330830eds.233.1629144575808;
        Mon, 16 Aug 2021 13:09:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id i6sm90106ejd.57.2021.08.16.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 13:09:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>, Joe Perches <joe@perches.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: refactor rtw_is_cckrates{only}_included()
Date: Mon, 16 Aug 2021 22:09:33 +0200
Message-ID: <1730270.0mlKN7IZV0@localhost.localdomain>
In-Reply-To: <20210816193125.15700-1-straube.linux@gmail.com>
References: <20210816193125.15700-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 9:31:25 PM CEST Michael Straube wrote:
> Refactor functions rtw_is_cckrates_included() and
> rtw_is_cckratesonly_included(). Add new helper function rtw_is_cckrate()
> that allows to make the code more compact. Improves readability and
> slightly reduces object file size. Change the return type to bool to
> reflect that the functions return boolean values.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ieee80211.c | 27 +++++++++++---------
>  drivers/staging/r8188eu/include/ieee80211.h  |  5 ++--
>  2 files changed, 17 insertions(+), 15 deletions(-)

Now that you took into account also the second of the two suggestions by Joe 
Perches (with a further enhancement he added later), I think that this is 
really a good work. Since the first series is gone, here it is a new...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



