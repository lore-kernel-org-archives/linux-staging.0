Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126770
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 18:56:00 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id q18so3402985ile.9
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 11:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=pg9Oc8FexJdwg++WGxFIyzfbO7HtZXQu4+lhfbZZJSA=;
        b=SmUnU1tPVN9i/9tG/rMNoyq8GC2Ca9VXG2fndr5Q7lbUN7q2OvL7b3A8tyIlk4aRZO
         8CxuepNlFVgtbqoM3ADQ3U0+DYSTh4XKY1ShBRwP2xptYX4NzEjxotT52leIbd5xNRXk
         9vOonTxqSQqQW8naRs/ta+UU9thoYqHRLs8DxUAFrNPA0djreJxetA6MW8BtY4WeIUIW
         dOTRz3L5cqS+wmNpuKdYDrs8Y7JxgzfS82zfkL2T7J9e0mh4UxOrd8m2b0kxlUw+Ng/I
         ath2ZAyFnQXTEeGUJcV4oPxvcRcr2dsP1ecLOrYEwKb4egINVvb+Xoa2A3ZtaP1NLjlz
         iCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=pg9Oc8FexJdwg++WGxFIyzfbO7HtZXQu4+lhfbZZJSA=;
        b=YoQCvFNlxXuZMrM+/Bs+mIA2MmItrRRA9PlBonEgiKCIdXJxvoyrx5n2MYZezh3c9L
         OUyVoo7Ufnlw6M6ekGs7LBRLqr0ZdvUy9BQJm4x/B7cAPm7BBAr/RwCKNlzr8q75nYyT
         Fl5zJh9riTSwXvZ6kXP7S63WI17HLwclOi/zu1HFuHLTo4oVlB/w7LVsqz7uMNJE7S9T
         dXYdLzCHakSpitzACV2YW1ZxAuf0X2X8yMSjcWvwUKIUe8oxR1al317F7Kj8Bx6MQbtU
         6vFkVHrY1z1M1pLdZlnsWW1COot/AeWd5BHdoj/vD660b8tzfuG7VEjJdnukr6Klm1g+
         b8nQ==
X-Gm-Message-State: AOAM532jdAXqis4uJrhkorZL3+SzF/6wH65DsdUvcNN1wyscse437IVW
	kv9PIKejF5PLZcK62/+0aCBKU5cK2FU7OTViCwE=
X-Google-Smtp-Source: ABdhPJzdp7XedqkKalo1YzTM6wrHzAyIyMCWMFfqhgcBbZM/+eDvInL7H0YNQ6mczgM/TVmUc+xtfPhLFrpBLGI8h4k=
X-Received: by 2002:a05:6e02:dcd:: with SMTP id l13mr851205ilj.300.1627498559514;
 Wed, 28 Jul 2021 11:55:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6e04:29b:0:0:0:0 with HTTP; Wed, 28 Jul 2021 11:55:58
 -0700 (PDT)
In-Reply-To: <20210727205855.411487-16-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org> <20210727205855.411487-16-keescook@chromium.org>
From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Wed, 28 Jul 2021 22:55:58 +0400
Message-ID: <CA++WF2M464stM5Cb8EpX+ecda5yymSZ0Z8PFPFEoqZ_iFhaScQ@mail.gmail.com>
Subject: Re: [PATCH 15/64] ipw2x00: Use struct_group() for memcpy() region
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Keith Packard <keithpac@amazon.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On 28/07/2021, Kees Cook <keescook@chromium.org> wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field array bounds checking for memcpy(), memmove(), and memset(),
> avoid intentionally writing across neighboring fields.
>
> Use struct_group() in struct libipw_qos_information_element around
> members qui, qui_type, qui_subtype, version, and ac_info, so they can be
> referenced together. This will allow memcpy() and sizeof() to more easily
> reason about sizes, improve readability, and avoid future warnings about
> writing beyond the end of qui.
>
> "pahole" shows no size nor member offset changes to struct
> libipw_qos_information_element.
>
> Additionally corrects the size in libipw_read_qos_param_element() as
> it was testing the wrong structure size (it should have been struct
> libipw_qos_information_element, not struct libipw_qos_parameter_info).
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/wireless/intel/ipw2x00/libipw.h    | 12 +++++++-----
>  drivers/net/wireless/intel/ipw2x00/libipw_rx.c |  8 ++++----
>  2 files changed, 11 insertions(+), 9 deletions(-)
>

Acked-by: Stanislav Yakovlev <stas.yakovlev@gmail.com>

Looks fine, thanks!

Stanislav.
