Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A74F2FAE
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 13:04:37 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id b15so31569642ejg.10
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 06:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvCfNxoZ3Ryu9UQ+39HeycOmf+nzV/nDWwq7unBedQ0=;
        b=tMyMtPLtp4vZi77oVlcLk8a/yyX/a7YBAa8QRDosX6Lc9txL8RVxhogmBQrbflH/Sq
         L9qOlxSHyceoROKGSxG/VpG+wVZ4BfaB24vRjXeJwaVRv71j0PK9xk6Rie09nI0ohBL1
         aqVWpqcZms9wVr+p4UPVYRZ6ameZ8juMd7sUxSVqOmuYzPxO4jkROh9TtAot3wJUc8WT
         iL5Ui9i1ERktNPMJ4dfVEu4uWWtycd7zP6bVPxeFLPl3+XF8pTGt8XEFkK504D+ccO/9
         b7KPms0f6G8Muw0pKYiDhC5zwL5PB10DlzGvN72qaNu+yPA7xgNMOtlkFGTO9x+hG6d+
         esDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvCfNxoZ3Ryu9UQ+39HeycOmf+nzV/nDWwq7unBedQ0=;
        b=qJOakGY+/qETafjKucovMxzh/SZvUXvTknddhauxPnngp9vniujSL4NKc6kDq5PVhB
         QLefaUoF5mvF4SxrpPbDrviVb0IfPI0BZYsT9u3XNJogQO/crxwvsgDkVrFg3xFwns0r
         rQ/6K2s05ij8bAo0gvY5W7NREcdtLylgNWs+AuWjqjYKqqBAUU0SYPSZxmIO/yMcaCjE
         voFec1zm7TP/np4fS3r/F4+VK6VrjnuJVqZOBNTib0g7EvecA34KLESk8pDptC5hn4Cb
         pZoMqohW9HF3ajgxkgqBqJXYSFz7/Gzxs6QwYvgvaq9nv2ZZCo1YDUFSiUbtmYhP54mm
         ZKBg==
X-Gm-Message-State: AOAM532Hu6BFPUyL7HeQRsegYhc+QwilOha9qgImNmz3bbVdlWNOwg+H
	yudxtfQFBjjnpf3pJWF4A3A=
X-Google-Smtp-Source: ABdhPJySviFnoT2Za0+D0LH8HciYPfW9vf+N9+GQUsqtN4Dy2R5rWJ7amDAK8SNIIZj1Drxs+UqqMg==
X-Received: by 2002:a17:906:e291:: with SMTP id gg17mr16191722ejb.477.1629119075975;
        Mon, 16 Aug 2021 06:04:35 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id m13sm3658987ejg.76.2021.08.16.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 06:04:35 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Michael Straube <straube.linux@gmail.com>
Subject: Re: [PATCH v2 4/4] staging: r8188eu: convert rtw_is_cckratesonly_included() to bool
Date: Mon, 16 Aug 2021 15:04:33 +0200
Message-ID: <14046781.rP7JVETYk7@localhost.localdomain>
In-Reply-To: <20210816115430.28264-4-straube.linux@gmail.com>
References: <20210816115430.28264-1-straube.linux@gmail.com> <20210816115430.28264-4-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 16, 2021 1:54:30 PM CEST Michael Straube wrote:
> Function rtw_is_cckratesonly_included() returns boolean values.
> Change the return type to bool to reflect this.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v1 -> v2
> Rewritten to apply with v2 of patch 3/4.
> 
>  drivers/staging/r8188eu/core/rtw_ieee80211.c | 2 +-
>  drivers/staging/r8188eu/include/ieee80211.h  | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



