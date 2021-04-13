Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F75971
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 12:33:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o20-20020a05600c4fd4b0290114265518afso8646927wmq.4
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VF1MXXyGrDHXIdllFbgniMv/v/labAzQbyRDen8apm4=;
        b=AQFzJwJirfLp6ZjlqMGSMrcZevxKkz6/3d/3JbpA9NutXdX7qVzx/j3zpFqsSHFKjL
         9da0UbOrP9Yo7eURxUmcyql5ttG108vN25dWqu0VsFl9OmuFbdKkYSqBNAKtINUIJUA8
         Za1zUWh3bF5Rt7lQmgP695fw9WjVKU0mocH79Ndd1W2c50A3xXfzt740sqg6D897hl0z
         IBWuCO+ehg/S3QUAF+TZ5prdnvnTMlgrUtoLFboYe/Sb8fWhFecrR8hnbwyPrw5uj3Dr
         gHd1gxwu+CvgUUg4mInzN13rvhlkloWRr/9MvIqx2RE7uzPTtesUAFikQ9PhMvKpbTVp
         yhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VF1MXXyGrDHXIdllFbgniMv/v/labAzQbyRDen8apm4=;
        b=ttQtqfy+l9obOGBLgm9FPbImiT0POxaTqc8Nt8zvYcG6EURyPdF/SDilBkSxgZpPLS
         2NE13Jg0gzZ2LfxO9zogHE7iffSKIFBENvPNvhWMjHx1nLkcdrVD2lM5qO9mhNgK9J+j
         wfwLG6vYVCO4qJqfvVqijea3t47DhH00jMSozgWBa78mdYjUqfKguEzJ6ltgFGPauX9R
         7HFbOL+f6bvyW1OsHmDssfkK87K5HNL6bmX+QtUp1F1OGR7ztUDjOR9lH5qU+9RUAwl2
         R7u2MOYs6EBmxyF45k9PRFk8qSY9nKLNkEATn9fm0iApEgjIVcxFuz0dh4sntR6N7F1H
         k3dA==
X-Gm-Message-State: AOAM5336zSUcvf8zy7VaGRXBoM5l6v/zlIXAqykXqmuK813535Kq6QHo
	gjbk3AcKw6N83C4dZYOlkMoPDYNbDL1vB663rBQ=
X-Google-Smtp-Source: ABdhPJxfn/Wr38Giv9fgJ84d77wrkjhlkTZEsxk4OEmgu0hdMlrJBx3f+4BRTn+zGo9qHDJ+rTI2tto4LwFSiMaA49o=
X-Received: by 2002:a05:600c:4f55:: with SMTP id m21mr3934608wmq.11.1618317234524;
 Tue, 13 Apr 2021 05:33:54 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1618275183-56792-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1618275183-56792-1-git-send-email-tiantao6@hisilicon.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Tue, 13 Apr 2021 08:33:43 -0400
Message-ID: <CAGngYiXRjaP6zFsZUKAzUHT1JxkFdQt+bdzxj7jX4uRpTkmUVA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fieldbus: simplify devm_anybuss_host_common_probe
To: Tian Tao <tiantao6@hisilicon.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Looking good to me. Thank you for the contribution !

On Mon, Apr 12, 2021 at 8:52 PM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
