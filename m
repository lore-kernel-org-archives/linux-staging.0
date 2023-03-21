Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D899440;
	Tue, 21 Mar 2023 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BaVu1ranY6IZPO5w8T3/AsoEgjpGKi9wefT7ScLRJzA=;
  b=o4qCyQ4rHz0HLQOMuw4m39RYMAtYSRZb8iuaciFdXgRTUtZTdFHRfgS/
   i1VstiE4iqZZPpF4+iWQv7brhOTXObHvgxd8eZNKJJraZz5wQugsVzKgC
   8vLlcs2rIq7PDZl7Tq+YBKgjG7I891md9gtQXBqkwIG+wJqGMgt0U7hpd
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,278,1673910000"; 
   d="scan'208";a="98275290"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 12:46:01 +0100
Date: Tue, 21 Mar 2023 12:46:01 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, johan@kernel.org, 
    elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, 
    u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, 
    linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
    linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/3] edits in greybus driver
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
Message-ID: <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 21 Mar 2023, Menna Mahmoud wrote:

> This patchset includes change happened in greybus driver in three
> different files two of them patch one and three related to
> checkpatch issue and in second patch convert two
> `container_of` macros into inline functions.
>
> Menna Mahmoud (3):
>   staging: greybus: remove unnecessary blank line
>   staging: greybus: use inline function for macros
>   staging: greybus: remove unnecessary blank line

Different patches should have different subject lines.  You need to either
be more specific about the file affected or merge the two patches with the
same subject into one.

julia

>
>  drivers/staging/greybus/gbphy.h                  | 10 ++++++++--
>  drivers/staging/greybus/greybus_authentication.h |  1 -
>  drivers/staging/greybus/pwm.c                    |  1 -
>  3 files changed, 8 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>
>
>
