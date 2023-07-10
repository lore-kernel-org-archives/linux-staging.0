Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D613ACA
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 16:25:46 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso4303051276.1
        for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 09:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689006346; x=1691598346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcUxYhRfSgJ6UJMmI4gvN/iDnQgX6gIvJpFELMHmLcE=;
        b=V8r9oUmNILl8gpI7KePWigjGb6juPhMnDQ/wrv4DQP5As/oXU9XrXK246f9ZHhlBJL
         NgW9whpWQvfU7c+x8gRKyIabFQLq8y1KB/91koW4cjzXCsMLGDiimO1rnhQ4A+SGtHR5
         0qPaQafXZZht0IpaBmneBm8MpeuLhudZwHH96ZviOLxHsfACKzldhpgZodjAA0l922q2
         pnlbiw/dn1xzxjuAiZWozy6KLAqPUfb7KpDVMBORNS1iEcJq7uIR6HeZQpCMJbhktMq6
         tW+actNpC+n4lGbQUGm2PT9us1+XZ/aHXZ8LEEsgbXOFg1elQLdqT5ptELvD1jDfTUxq
         L3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689006346; x=1691598346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcUxYhRfSgJ6UJMmI4gvN/iDnQgX6gIvJpFELMHmLcE=;
        b=Gbnds3NyCTvw63Im+BL3AVR1bmExz/ZEYsDSo6NvbHeUFTJIdDQdnxC3NW+yYYuWpX
         m5wdQBHUnpW6qF4J8DoEtOOkXDLWetxDb95jgTsCECHOmJrGGFe/1sdZ3cM24fyOuQZO
         Xdb/HdIduDJNLB9K7X+elIHVbbcWdS6OzO37JZs9ea6Xzq3/wlRjHH4exYAYqNtaJ4oY
         cMGvc2YVHzWIk7Wx3r/SCQTBC6Z7knWn8Yz0QV064LPqNIcyaAOz6Kq3QnEy4gzsocLI
         Xycc+x3o/zLo+1l1a6aGHv1kAv8KBpztz2Nyp1my6Dks+my6pYK7JPt1MOf6utVfgKY8
         7CmA==
X-Gm-Message-State: ABy/qLZR08YYi3u/N2CsSyBt2/QfEjExVsaE5ofN7wyJ5CSoPgZLYSIb
	+/wM0K9hC7rT+29jhEvVBslWb9jiw0v5410VFbk=
X-Google-Smtp-Source: APBJJlE/krGaema6oAIGHffoO9jr9rNxV2NJ9f2ty64/UeXp1MrrtGwo2Rtyks4ROqL/F/KxuN96NsyBfRrrBujlbXI=
X-Received: by 2002:a25:c0c8:0:b0:c86:55c7:d053 with SMTP id
 c191-20020a25c0c8000000b00c8655c7d053mr2292204ybf.25.1689006345894; Mon, 10
 Jul 2023 09:25:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230710130113.14563-1-tzimmermann@suse.de> <20230710130113.14563-10-tzimmermann@suse.de>
 <CANiq72=9PoV3FOcXx9FdiSLePKXDG4BSY_5-jddBkqDL=ua3FA@mail.gmail.com> <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
In-Reply-To: <733273ad-89e1-d952-37ee-bb75c3ab8188@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Jul 2023 18:25:34 +0200
Message-ID: <CANiq72kPh2KE=ADUxhPyyr7noWhC0fkzmDu8EBn_20focnZqtw@mail.gmail.com>
Subject: Re: [PATCH 09/17] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from
 fbdev drivers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, javierm@redhat.com, linux-sh@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-geode@lists.infradead.org, linux-nvidia@lists.surfsouth.com, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 5:22=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> I'll append a patch to the series that documents this.
>
> Sure.

Thanks!

If you are planning to take it into some other tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can take it into the `auxdisplay` tree.

Cheers,
Miguel
