Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983CD2FAE
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 13:02:29 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id u7so2117495ilk.7
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MkYUY8hRWwEu70DXUFF8siW38IO889EQpcP0JG9olHM=;
        b=p816tpeNXiyVNrHjM3CLMARaTaQ9Q1DNkBPMF5S/QiTyS8TtyNuS4uSDtOvWYkZ9DD
         KQs/VrSCx51qbgHOlhlqY+ZKamKhLS30a7nBa0Wn0WLKywG5EDsLvKzBc8Q5yqbovwVx
         JjTa60sLtZoqpUSmCE3n0/wVzWzMxMTWIHpNstWexLoJOQJ+OxMi+XyB3QXEwvmEN+f/
         wXa6Legda4Ugp7uCGvf3V1ZSw2wJsDe8AJmzt4yb1ib7Fzm5YmC5TfAcZFARVI54/XV+
         DmeEiBYBUtdGwSDq+flIDrO71sP+aqrSrFvrxjsUFvpe0gY8Pan4eGGNA/tuXNtoplKZ
         TcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MkYUY8hRWwEu70DXUFF8siW38IO889EQpcP0JG9olHM=;
        b=R+zbOwVmNIc2Udtwh2ZhGKvcTZCQAb/cXb8VI77NORCYNbeRbfVslyrlmq/UmJS5LF
         bGdTeKyidm3VAGdS9W/CSeYxenhXdH1w3tu+nM5D/zykpTCiTkHfXghyZe9nX1J4vr4L
         HXoICbLTO5GPnJI4IaXBQptYkrTbQOMld8wXnt3hr/z0zi8FYume2rFsGej+BA63V48/
         kky8tPXRuTDeERieZtH7OqEIM8ITWuTAn6ne7Yqio83TJHyjZ1InaHCVtb+GEVNYgxwV
         bQJE5HivBBIiMQgnp9fyhY0mapfRjs7+YUwaasPxPgajS9elNNHf7lGTR1ak5klbI7Qw
         l0vA==
X-Gm-Message-State: AOAM531DpVQLva9NXfaHcEJQaZSgFWSsIbNTkF3imz+3+8xIqanDUstV
	sGiRD3to1etnGzCEsXlelRlAICKH7csWxZ89EjI=
X-Google-Smtp-Source: ABdhPJzz3GCPM+tS9a6+M7GfZUygskgS+S/HcxGkyNlHvv5PJSFF8ixpr8ONuLYhcpUTCbKIGIlu3ps94hS6aZMTaMM=
X-Received: by 2002:a92:b711:: with SMTP id k17mr6012067ili.247.1629291748768;
 Wed, 18 Aug 2021 06:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org> <20210818060533.3569517-26-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-26-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Aug 2021 15:02:17 +0200
Message-ID: <CANiq72mQQuwfpFdxeJQoKnfpUFSPuakHRm8RC+eH-xECBjwDkw@mail.gmail.com>
Subject: Re: [PATCH v2 25/63] compiler_types.h: Remove __compiletime_object_size()
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Will Deacon <will@kernel.org>, 
	Marco Elver <elver@google.com>, Arvind Sankar <nivedita@alum.mit.edu>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Gabriel Krisman Bertazi <krisman@collabora.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 8:14 AM Kees Cook <keescook@chromium.org> wrote:
>
> Since all compilers support __builtin_object_size(), and there is only
> one user of __compiletime_object_size, remove it to avoid the needless
> indirection. This lets Clang reason about check_copy_size() correctly.

Sounds good to me, the indirection is making things more complex than
they need to be.

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
