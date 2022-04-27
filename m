Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A167B;
	Wed, 27 Apr 2022 15:37:32 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id r13so4197552ejd.5;
        Wed, 27 Apr 2022 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNqxfkqFclQA7PXgOfrmIV8J2NtUqFWiqkPpYcES2h0=;
        b=gZUesZ+UkvRyTGGiwlhLhgiwcgfhcr6YnGD75pwQU7IODUksKldYQkWR/QX21VRjMX
         iOMydL3N6dCsZQbDLndyHb6qBjexcHR9uoLJG8kouc6sTc8n9E3++meWL26y95Au6kMH
         aUY3Q6crgZq1bhA2L4u3fwvUPlXw0qu5Rxdh6O8HkDc9kczVraSiOib7Shnvu8krL87V
         pEjfo0am84dDiaP1h4TZ6kb6wnIWEUjTURI1BKLVNxQVfGn02p40JB3F0ZJixoUXUAar
         xMdf/TSItRI49Z4sOlqtDiHjVAE/QYz0iY3GPnMRvI91i2N2ri1fNoohLHAKfM8op1yy
         22Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNqxfkqFclQA7PXgOfrmIV8J2NtUqFWiqkPpYcES2h0=;
        b=5YVHU0CwIUkm/m6IbwEZh+Xzd9xVy8Z8TMQ3tP6BmYMpM83u6GhHvo75me09Pt3zya
         rLUF58A35/wcqi+yVeVHXiZoKZzyZt5Ha/PvMS8bxqp0DlyIRv+uiMfruHjrtGb7PLw6
         R3V1k9C5MVUNH5pAsKOsj6NUQUJ32olbk1stKr2q2i6SGoYVn0weWGcMyho+w62h2nQZ
         Sgc7zKMN7IZHd6M+RagN2mMo07ZfccHNqATBerFKbX4yhheYYYdYoKk5UnMzpAy88wXL
         9riQi1ndnZ2KGwLC5TZ7eq9Et3ZMP3Q4bAytM8N3pd9I5GvEA0fWPIHBgQq0lDKQ9fgK
         ZBCw==
X-Gm-Message-State: AOAM5304OOh7cPeiuPd6ZfNpkGNJzMXI4TKIzt/jfw46ktHPTHz8n6rv
	uee85qSKN15Wy976oo8muw6FA8n7IPENJLVuV3c=
X-Google-Smtp-Source: ABdhPJyxcoedA4AG/7v0zbg4RNRy8/x3P6pyVM4SPXZfJAD1qDqx5sgN+MwOIPT6a+8l0hVZBNgIbWNsGAbBamGB6oc=
X-Received: by 2002:a17:907:7b83:b0:6e8:c2c8:1f14 with SMTP id
 ne3-20020a1709077b8300b006e8c2c81f14mr27432948ejc.356.1651073851032; Wed, 27
 Apr 2022 08:37:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1650568579.git.jhpark1013@gmail.com> <bba338ae5f9992dbf2a64b388f7702e6b287d8c2.1650568579.git.jhpark1013@gmail.com>
 <YmK/o23YIeXwKlep@kroah.com>
In-Reply-To: <YmK/o23YIeXwKlep@kroah.com>
From: Jaehee <jhpark1013@gmail.com>
Date: Wed, 27 Apr 2022 11:37:19 -0400
Message-ID: <CAA1TwFDMpNuWjKDBW2L0q31FHHUcQ8RyrYBpVDAOmQCHV+qxTw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] staging: r8188eu: remove unused else condition
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Outreachy Linux Kernel <outreachy@lists.linux.dev>, Pavel Skripkin <paskripkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 22, 2022 at 10:45 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 21, 2022 at 03:20:32PM -0400, Jaehee Park wrote:
> > s_ret cannot return '2' so this else condition is unused. Remove this
> > unnecessary else statement.
>
> s_ret is not a function, it is a value.
> rtw_select_and_join_from_scanned_queue() is the function here.
>
> Can you fix up the wording in this changelog text and resubmit?
>
> thanks,
>
> greg k-h

Sorry about the delay! I've sent the revised patch just now.
Thanks,
Jaehee
