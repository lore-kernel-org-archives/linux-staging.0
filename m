Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D561C10
	for <linux-staging@lists.linux.dev>; Mon, 24 Jul 2023 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690188257; x=1690793057; i=markus.elfring@web.de;
 bh=WG0eTpwF5ilaqJ4Xmjmgk2vL1nrv3MgmNbuCC41YfPk=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:Cc:In-Reply-To;
 b=WC23UmBdXsjH3FMIhqxJQeK5uPumvBdJbgkusvph6mK6zRDpebdsIi9SaX8YXAzolxGCA2T
 UeSjWJG/qpo8ncxXbh0eV4DizTSL4JM4t+QRTLVwG3X9dCoH9ppJvh9Zz1ICJY8YB7dzL8cuk
 g+6JQkeOyhoUlXuMI+7V37RiKVpyKgctFAtFEIYkSWIbJuq4x1cQeND6QjESo2OQGVhp7L5tG
 b/K193JsC0NOffUmpNzVaWQl91a1zAY46Vj1lLZC0w8EAOILZevlReBmt7OsMwauoexDBAp+w
 gBLyqRV9rkyAGDI7tGW9IRQBbMtPy7BfWHTlmFA0Jl7fzJU+xfrA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1d7s-1pvQ9h1EFM-012Fe6; Mon, 24
 Jul 2023 10:44:17 +0200
Message-ID: <c6374bc6-2a56-23b0-6ef9-def092aaed4a@web.de>
Date: Mon, 24 Jul 2023 10:44:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v4 1/3] staging: rtl8723bs: Fix space issues
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>, Emily Peri <eperi1024@gmail.com>,
 Guo Zihua <guozihua@huawei.com>, Hans de Goede <hdegoede@redhat.com>,
 Kang Minchul <tegongkang@gmail.com>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Veerendranath Jakkam <quic_vjakkam@quicinc.com>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
 <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
 <CAAUT3iPUaNRUyvqP1O97M0AmKri7Ghc06ku4TS6vcHQ=Sb4ycg@mail.gmail.com>
 <67b16362-aace-28e3-6776-aefdeab0f183@web.de>
 <2023072453-steam-scotch-bc17@gregkh>
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <2023072453-steam-scotch-bc17@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:s6BKVRH4MyklxFdPmKWFHWctfjVKERWu5UZ2rTsrKzVNXUyevpG
 PhE8f63X8cilxqD7kTdhpxW8VdLCeFm4FIpCSI3PlbXUqOTCCEctd7u5Ky2UOmurcFij4AZ
 Wa+hUkIBR3zZ1YzbHQ9CNfTBpWRLz8USRLix5JA5oGz057kG4y7j3tyBKMt6kj7HsJOruh8
 wuPQ2XYEcgq91u/NekmDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BVQdK/63qsM=;bN2aUKls+XzPsaSdQyrAJp30KSJ
 dqVY4fCcevJCDkfa3MF2o/2QPrwqMF5hddgIPGYHja2uX52PYhZfH3eLDHkf6lF12RPOkweFM
 H1N5VryL7vXxEVE8k32+4oqlgH4J2pf7Z4fvOHHZ09LiyTUkrOib1q4/j8O1KIjsolVFi65CZ
 aedCUcQDoKqdX7ZcemC1tLrKltwomeT5+8l7kyVJlgRnv054ri7hdHBbB98z7xtWEkkpr2taJ
 8LMthCGqxKTWr0H5LF5YLWuDT82c1wKLiZIPw3rzM1gLXMDsOn7ASNfj9NcGBgtkKmG9o5xAf
 M5ic2XHbsCNZF/A7rJfC/aQ7X9b6Hnkec8INhRVYsvFajZTu/anZgpoWwh5LduOHvNz0trOP1
 ig1+Gjiv03Z5HlAxy/OGiHUucNuEqGdoXtIj/xY9g4mfx0VfnYgsSaLaZmUG9cqdbGuTTj2MW
 KNcjSejzSMa8YTV+KXQXmIB21Tq0a2+gpbH8Dn9jdI+wvWYRaSY3Kvr6+rcMmZuIVV7yaNoDm
 fwJbcD0hBCbI30oa1YjSQTdVDLW4QVggxySXwRIZUnQHHNFNBeparxxzdZH8t6/mGjLgPNlCQ
 1zMrfYqvFXySmWasiJ+uSNcHepVYueYYAk1h42ptXsmQnLrgkPEaeOFr49nNwz25vIu5c/C73
 6+m/gblhGnggq9SzliKife4HZJfvFpe3JXdBBGT33drIt7iqoQFaqT5q9kIfN4qo+Rqas780k
 Im+vjMMDVvoMA+uvOJCV6MIMtzvUkhTHy/1tYfm/m7Re76tEhcmvhowNCfzlTJqG75BQ/So35
 rcVlumbcYdzV++z3kCyTJUCYJTIbcW5hHQ6S3soEOmUjvhc+duu5cWZnBZcRFkPtusx41lQGU
 O6BhT+Y3QSQHZMDgP7xv+0DLo5Ui0+4axh4Q1cgcl+rv8u3t7iJNcENL1246A9DvP8oJOonJx
 KjaiGQ==

> Everyone please note, Markus has been banned from most kernel mailing lists,

I hope that this ban can still be reconsidered.


> and should just be ignored by all patch submitters at this time.

There are contributors who are still more open to presented information and ideas.


> Please don't treat his review comments as relevant, they are not.

I find such a response questionable.

It seems that it indicates a special change refusal because of
some communication factors.
The awareness for the relevance of some advices can occasionally evolve
also in more desirable directions, can't they?

Regards,
Markus
