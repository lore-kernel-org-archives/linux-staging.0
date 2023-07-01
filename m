Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25DC2F0
	for <linux-staging@lists.linux.dev>; Sat,  1 Jul 2023 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688225653; x=1688830453; i=markus.elfring@web.de;
 bh=m+RfItLtP1eNlVWBuBUvGTmHBgbd2OWDRG+Mq+hCTic=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=gePaojj7WDFO4pSAb5gYw4Z/iHJ8Ek/gffkcREu/5IWl4JXl+sTTsG9FyZrk/zle8Mch+qk
 hn5BKgN9bbHE0oJYu20u7NzHp3E8H4FWwoU56qu7fjFQY0QgoTNc7Wo+BZ5m8HnM8rfQ6VX2s
 R9Ftg1aJZNErAfNBXUrCLqNUeyrUTxLsr7G9IH/9W6o9HpCWvR8wVp2cyC2PKROyUkWmGUN+/
 OPgrBZvRkLphV0e09yQPE4Gfi5xlm6nVbYycj4yCqb2GP+Gk9ym6JHiCIHSGYLHTKXurqk492
 ZUzw8BbRw94KpYjcRS4HraoAp7UReTx1+Q7hSYwpRCCfrxoU7a4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mm9Zi-1pXnT30GxM-00iO2g; Sat, 01
 Jul 2023 17:34:13 +0200
Message-ID: <801dba56-e7bf-b966-c2c9-b50a61fbf158@web.de>
Date: Sat, 1 Jul 2023 17:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>, Emily Peri <eperi1024@gmail.com>,
 Guo Zihua <guozihua@huawei.com>, Hans de Goede <hdegoede@redhat.com>,
 Kang Minchul <tegongkang@gmail.com>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2023070123-unburned-worsening-0713@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NqZaF2F3MJ/73+VF6CXvGMl8SCq5Bb546hRbzEL9Zdk+r+kyZ7h
 FBCSU0aDihr2+sPKKdInczul9wQ22ts0//1/gTHHrBQsR/2Kc2tkhI2GZreRz4YedTG7iwq
 HFMVqrKbJcNO1LkZjnXkyO6FpdprYCZzihKG+V6aOPC7ciRghZh/icrX4DaMmYb4Mav3ts9
 nTLo2y52tdWZ57F1r+mNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EE5TNLEMKIA=;7onICBush1PqIaMm5CfSltwUYf+
 35p4hOPvfS7hmZSU4GewpoFnud4os8P0kVZHZSrNht6pxqU2Wp1XnRqx6enj50l+VX3Qbrw/x
 vITX+j/TJAmTBMfoK7UIBdGYw21w+SUi4qzwgDt10ta+33K2pAuN+PfmO0W7MtNGsmAe6TXGQ
 7oSGhIVEsp2IRpshSa34SXUZi1szhjhwqPaO2HFOsMlA3YxRD4hh3TiQWuNcAfYIFhZcoJy4Q
 oZzAZGi3Mh3zJv+AkoyL+nT1XsUzHEYVuKDfmoZpb0lHrvhpzJt8/EoMsWp4sl9gpi4zYJtrJ
 7p56xRerx0O41RcRIUqflYYVEJno3h8n+o7nzDAouVu10Gb2fu4GNVBbbfo/ITWuMLrl8I09i
 yQ9iiHr4t5VNaLk1YM/zAitTi1aNdpF86tg6qJrNPE5NyVSBzojMRVvOgxw580APY+I3QFW6c
 32keW9VMEObEW2P9d6bS4JYbSPZnvOCEWM5naSDijuSb9jsve6bxQTKECbC69GoVbsUMUEXFv
 dmuU1soapxtZiJxlchZ+9Eui8Cu5seZzKHexCnwEZTrS3/sLKMJLUWKcdJ6wcZ0PsHpjB6nIN
 i2CFw/hQFlZmJxX5kFqbCkzo0p1g3F+tI9s6ygaCsfDaq5KZdCDtyp1vo50cqy+JwHi6ALzzO
 Ku92Rc/h+oJk+m4nscD/m+5NWHMvlHX5VG7V6ccafm56SX90Xn5GjpUJBgmt7HZ5YKQC5zGcb
 l3QhpJFZTcHjbl1DhkgjVyQ0KUoIgDj9pESQC3esdf4BQk8C/OcTM7V7z8q6pwSOUvNU84Rdo
 M/HHTFs9LBVs7u3odInYizZ4MI2JApryW7Ql/4yrFFGa9hxDxx580cW+GOsfDfvSK85zyAudK
 gzLSvmUDqJd330c3y5V/lFU8V6Ch9K21Gbu/9s3ujU7X6y2JhjRnjuPO3qog6CRQCqfdUfdWl
 qYzXwMZZmRIt0mNeb9sYWFTtMYw=

>> You should not put only your own email address into the field =E2=80=9C=
To=E2=80=9D.
>> Please reconsider the distribution of addresses between message header =
fields once more.
>
> Please do not comment on staging driver changes anymore,

We stumbled on recurring communication difficulties for a while.


> it is not helpful to anyone involved.

I got other impressions for my patch review approaches and further change =
suggestions
for various software components.

Regards,
Markus
