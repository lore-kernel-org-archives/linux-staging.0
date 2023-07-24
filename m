Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D10C1C03
	for <linux-staging@lists.linux.dev>; Mon, 24 Jul 2023 08:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690186076; x=1690790876; i=markus.elfring@web.de;
 bh=1eioCrIdrj2pWjB1HzwaVj9lhW1YwduZAJNZVyOsaC0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qN8G/DuQaJ/Ao/9EHeAwvT6sxqyLOd0XJpce60loHMG4ye9aRXhxEnBiiJ9qxLID4hAZSFY
 nHzHcnnEdV4DTflJ5ORgUeIJDwr8i6sMz+Vjifhg4bK8Q+zpFg8GejJuG74Zn1DUEDa6bdvvr
 ru/7D1kHJ2RQXO+jbWzISlWrQ1pDi9XoHfsK2zjwPh7t38hR3ztau4KLtClBFtYOBNI4f7kCr
 CoygngAR6nTGscWvxm6EyvPpp9LIi1ZejMXAj8FaJZd7wlDw2UZ5gTVYtAKJXfHwmXwn6uoUZ
 3vYf1S794FPF7H0/M+lo5kjxOzYrnfJajirtttNej4EXlySK1pwg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsrdM-1q4GQ81D2W-00t3sW; Mon, 24
 Jul 2023 10:07:56 +0200
Message-ID: <f3e60a6d-1341-545a-57f1-9934097994f2@web.de>
Date: Mon, 24 Jul 2023 10:07:55 +0200
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
To: Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emily Peri <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Kang Minchul <tegongkang@gmail.com>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
 <720bd622-a9a4-46d6-8296-f7ec644ac091@kadam.mountain>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <720bd622-a9a4-46d6-8296-f7ec644ac091@kadam.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p90wtSTt46Ktlmzk2PTjhXSKr0Cy/3bSg7bvbWbKFqIemZvpnGu
 1G6lzpxHdgTPmytNHeN6FLsuYuAVG32hGNCikvj1n9PQGXy6UEtUtaTi/RSpPewUgB1k5sB
 wDQ8ghDftkd3HsVu81wM6PfgAQGHxbjGeVckG9GDHyRY8sihfzznwtHNBqyluFc2CPPbe9O
 YUsDhKg+nQh4PPYbuolSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RZbVQlM7SV0=;hNvFaoLe/+cp7/4EbxxL7NdMyM3
 W+M7Xkk1af3zprhIy5dc6UmIZmJqQFgADWg1gRtUeMaCn46cOud/ee1HWGadJdpwKw2PiYXpS
 Tl/9f/sHDz1tCGM9SszWfU7ljR0K/9pdWtMAN+hnuJxh6CiCe/S0OtnYUuF/6jdO2vofcxrwT
 Aoe47KVDT40iR769XEW9Un3ejcilhs/IH2tI8unn8JYsX+CCQetNsXrVe2yV3KayIvzmCIcNl
 B2NyAPEf0hfoQ1G8ZDJRNzTGDZIj6+8ybRewJGhuGI6ECvDWQz1ZDHrkEBdpIyofgRVTfQDjz
 l++R0fs0Qs2iSklOh9kovWiwtWD2vyntNRRzKB4kKp/2CY0D3Gx2Tfmw5xvm94OI+j13UqE0O
 YxAD/FijM63TB8TR6eTMk19PXIqTobyVe9hbfXNm3RBAcbqNQYzQYszTxT/tiV6bYkQJf1eKn
 osENY70CnikR7WX0zIZvBZuKXFQGgjOpynhfiJ4eQha0VFMBAXluZ+A4+zOqUB5RxDJKvhyVf
 qPTk2VSCUWKyyUyrheeOe6K9cDsRxiAQO1BSuGlLLaUnejTfW4ZLfUIraF58yImJgcK3DVc4Z
 8KkIWgdafeux8I4S13YSB/pqLNwlQ4l1IbMGUJxXsmtMImad+celX1lEIXxdDr3A/vlBDcdK+
 MLxtqfQFob0EbF/bNexttjIlVbTu8DJKwqvHAXzknRLo8mKT27mYbrg0pLO2KHzh3eZOZUCtq
 aX9aMJEX7kieF2YWi/zdxd5wjiFgsl/uH6VFHQdyplHqVfjlMyIRhLyeflDG8rPqqds32la2q
 0QkDt+eNBID5z96ro3Xj1sA+5uA7mPjPRdR83BetbUxAvdfvV2NzkW2demJLCjUBeCXgIFGhk
 JIVJ4ZTTEsUzMKybp5C91Z2Rp+MIPKZkcgp6Fi4wo+1zpA3lFY+2XS5q6bSKTZTRfLS1WDm7q
 qfJDFQ==

>> As far as I understood, I can ignore the comments from Markus, correct?
>
> Correct.  Just ignore Markus.

I guess that the involved communication factors are becoming more interest=
ing
for further clarifications.

Some participants might occasionally find provided information undesirable=
.
Another fraction of contributors can pick corresponding change suggestions
still up in constructive ways.

The expressed desire for =E2=80=9Cignorance=E2=80=9D has got a questionabl=
e risk.
Some proposals and ideas would eventually not be integrated just because
of the way (my) contribution reputation evolved through the years.
Thus the same advices can get better chances for integration
(if they would be presented by other persons), can't they?

Regards,
Markus
