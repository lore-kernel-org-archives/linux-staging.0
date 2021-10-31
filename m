Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537E72
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 15:24:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id i5so16894640wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=19n05qfiW98RVpHOrFkOChis0ARUtExJBjEeqbNaB48=;
        b=KT/evdb/mWK+KSwMDlCs317aUzvSEk35gqa7kNBMlUxM8j/x/nMxMW/6sGndd8w0hM
         pdijaFIFR3rYIFia3difbA/eTYS2Dd2IfqOV8rl/0VGB/Mj/eacovUzv8VpGum286Ut1
         n1XuXp2GdDNvaMBUrgPqiDEU81RdZ1XwbKH8Iby4acoFO65Njkn6LUK1DAKJErV635S/
         gQidVT3i22S7/BZoGH6GSQapknLtqdUkG0MPcynSGD/aEoNvfwsajgcnZCJAqyF43lDP
         LwoY0YoYxn3j+mKQ/yuI74SQFq9J++GVQn91cDxaG7VwUYGgxArgpJAeOa1v7B6BAzAv
         jw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=19n05qfiW98RVpHOrFkOChis0ARUtExJBjEeqbNaB48=;
        b=VqeyWz4EnOTlTyy5mW3GaTfvnhwLa18VwPnzrZBJVyGJAEiomPzL7eSoSR51rvjKiI
         JMqbV+3wm5q95QEIAMzO85rSw137QFxHKL2TWiZd9/hVpQrR8Atx0NSJxjki4VnWJJqE
         3j80eG6pZ6yV4AJ/b+sCSPzHABGBG9AL07jJ9oTGZ7lz4nDXDw+DsFyhJA6iMyTmbnVP
         50SNVfcEjBgnlHmxOSIP2tzjMlncq/lkKXtSq5kbOxnIrtK50odw7Xu2/q23XjkWcklU
         Rk/s5+vOuqtLTaHmeAOzmVHQo7ID3OHTxOJIFnfLZzwnCk3eNBYd63SjNpuYEzIW+8ir
         x/2Q==
X-Gm-Message-State: AOAM5327Mrwcf/TCaILte3/H8/VOeOl45iQeiNYYnIPFkRZdc7ApEyl9
	QkIrYh/2etHSiloyp7WA++x+vD1id91r9felpz0=
X-Google-Smtp-Source: ABdhPJyVubI0Izo451jDFLBTdnlKkV/sCPtXFoHE5sTmS0iPFH/YePM9+H4bJrtnVWz5ti5kzph6aAlOf7mv3f4Yyos=
X-Received: by 2002:adf:fc88:: with SMTP id g8mr725217wrr.334.1635693868148;
 Sun, 31 Oct 2021 08:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211029132700.8552-1-ajithpv.linux@gmail.com>
In-Reply-To: <20211029132700.8552-1-ajithpv.linux@gmail.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Sun, 31 Oct 2021 11:24:16 -0400
Message-ID: <CAGngYiUnYQok=9XUr3wXo5WERTMx-YJeaQUyvYMgbcgLXoX+hg@mail.gmail.com>
Subject: Re: [PATCH] staging: fieldbus: anybus: reframe comment to avoid warning
To: Ajith P V <ajithpv.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 29, 2021 at 9:28 AM Ajith P V <ajithpv.linux@gmail.com> wrote:
>
> host.c file comment produce warning with checkpatch as below:
> WARNING: Possible repeated word: 'interrupt'
> Reframe the comment into bullet points or steps avoid this warning.
>

Looks good to me.

Acked-by: Sven Van Asbroeck <TheSven73@gmail.com>
