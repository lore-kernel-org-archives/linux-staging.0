Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658F6D0E
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 14:29:12 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id o10so2886827ybb.10
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 07:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cJ1HKbVq8oYS2MezhvWMnzWregg532xa6RuUFoQmjM4=;
        b=j5HdqHozCPgm+rdf5wrN48PYpnJ4eAaKZCJ+dTn5RHjjEpDtAl5aHtC7Yl7f8yDE/p
         wJysoQsWiCG7OFsNmI4mduW3HU5peiVJC8T8QAbF8NW2dTdqK9i9hp46bKcHjikg2ZLq
         gJH6/weLIEkoO1+WBdWug5Q+LDKGBbqUrRYdgLFyXfqlHvyNH5WXB/bWIQgFvaCO2kI/
         Hrxvk5NQKBYRi8cM0Mutcc6vx7plFq3/qkBDZH3a6SQC2tGp71gQcZaUM3Ey855xVxTE
         yqSmY5azF8GTh36VOufefn4uofO8tnmE4YBsDciZTNL6zGu5Go92TeX8vdbzOde/DmN4
         8L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cJ1HKbVq8oYS2MezhvWMnzWregg532xa6RuUFoQmjM4=;
        b=Ytgptz7LdTVcATB4l0VuJ9e1jyAvbGgav1fo15vs733Qm5IrJlPCpncNBhWwTTNpzu
         AHKBuXDQTdprb4MWEPSTLkPTH4pUKaDi4apb93VoWYfCLrVTSlL54RtoQyXwAnLas1U/
         8P70++vGl+afX3fMAnSaN16Cr5QqzV55n6jPvQ6i9k55CMGBngy79oE9ftI9lZZYdRmE
         snHJMjzNv1iknwSqH1WHuy8HdST+L2ajEbX3hzFAT2j2serISDPBOgpPV4oR1P/Ne8Io
         BYrItsx4LBJZcpiKmQzmjvjqngE2mUYmmUYLgwx+k+abdNLSpVCAccmnuZIUNjDC9xSc
         feAw==
X-Gm-Message-State: AOAM532mzI8qfO5dlW4JMztTJVOiPUo06lsNcAkdXqkJQESJ6k2rleIa
	qSgN2m60VdtiUm6ozf5tjXkUL8vPyiyiIeNowgU=
X-Google-Smtp-Source: ABdhPJwV/UAGKfdvuY2VHiZaUizO/h/HFjqV/HN2u/My7JCKnVvCPkkukWXZdo/FHIwjFpx9JnKXK0KJ68bpfCHNxiU=
X-Received: by 2002:a25:3211:: with SMTP id y17mr11618063yby.44.1617892151657;
 Thu, 08 Apr 2021 07:29:11 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210408120929.GA4346@test-VirtualBox>
In-Reply-To: <20210408120929.GA4346@test-VirtualBox>
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date: Thu, 8 Apr 2021 08:29:00 -0600
Message-ID: <CAOc6eta6ehHRhEYrWv0daS6WrC4oJg0Q8q2CB=K5BzF-E61jxQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8712: remove unused variable from rtl871x_mlme.c
To: Sergei Krainov <sergei.krainov.lkd@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, florian.c.schilhabel@googlemail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 8, 2021 at 6:10 AM Sergei Krainov
<sergei.krainov.lkd@gmail.com> wrote:
> No side effects can be seen locally or in r8712_find_network()

I am sorry to jump in. Sergei, what Greg is asking is basically why
you want to delete the r8712_find_network call in the first place.
Deleting an unused variable is fine, but the problem here is that you
are _also_ deleting a call to a function that _probably_ does some
things that, even if you want to get rid of the variable, you would
probably like to keep on doing (and so the call would remain). Is that
call really not doing anything relevant? That's what you will have to
explain in the patch in order for it to make sense.

As a side note on top of the question about the call, it's not like
the variable is not being used. It's used right after the call to
r8712_find_network to check the result of the call... so is the real
purpose of the patch to remove the call in the first place and then
having the variable removed because there is no point in having it if
the call goes away?

I hope that helps.
