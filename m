Received: from outbound.ci.icloud.com (ci-2001k-snip4-7.eps.apple.com [57.103.91.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AC838BF61
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669624; cv=none; b=V07xUnFTkY3tuqdHmONYsOQ8epBacI3+PrDpLK/xgzT88MG1//bR2dW/N6NiCScrEifaed66TpaQJldNTxqALcv44vcsLpBfN9plUK1uA6pP9KhsZg1YVkCsROx741P8RXNNOGQ4v20NV6hkNap4drucrjp5TDTf+ZUo2J5QQKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669624; c=relaxed/simple;
	bh=5x0Uq5JuBrvAqSuX1Pk3nW1CxuAXoYbGI1PEnHafKYw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Op8N7q1vHRkmSK6yBZOC08mgpFjgtXecTfGaJp9FYasmLgwkG2q1SdJqqbtDz2C4I6sHrgKlmZGZv9Y/NCJ/rVo3MxH/8hgmvD2bi93VQS3RzxJ4fLNSll830OadLCLkfQjmyoqCClb53iBrQTLZf9NB1XMbWLHkVMWC/8tjmtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=UPxw2Rv9; arc=none smtp.client-ip=57.103.91.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="UPxw2Rv9"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-11 (Postfix) with ESMTPS id DE38C180011C;
	Wed, 13 May 2026 10:53:40 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQxWB1sZUgVeDkETCFNWVgVUGV0AUgNfFU0LUgBSH3IZWhRcGFNFUR9UWFUJCg9HHVgWXghfBlcEShleCEMrWxNVF0YJGQhdHRkKUFAOS1oVVRcOAkIfUB9MFldDVAIcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKAlEcVg1XQ1QEX1BUEVdQC1tzQns8cVpyRgdJDzoeWQYtCl0AO3dbGigHQgFJdVhzWANBfzhaDlsERxQXG1wACUtGCUkdDgRUB10FXQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778669622; x=1781261622; bh=axdEwtW1XoAZTjnh3CGq6q2MKF5pQD1zTpg859lF6bY=; h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:To:x-icloud-hme; b=UPxw2Rv9RsX50czlLS6hrXE5APBk5JYJdPs7LYFb/qWuj3wbpgY/gwomO6yO9Z13jZUQTr+1EjgxF391fuHUNQM2gxyI7dkmlxLtG7WU/OA7WLyNbWK5e7JlKdqHHu+gnL87BDOeYPIltETC01iuhs1qdS46ak5dMLgGov9EcpVD4b87e0OE5l9+OoIFCqHpAIQQtz71/J2P6fT4cvqUJaWrPAwJp6jz7TrzbG28kuPrdpyv9L+XRQH9TgFuOFKbcBk8Y39VZXXrUOs/VcPKOSLPxmhQ2tTC0d9NhS1a9ouungYnT+6cUTQcl6Iz+P8usQxw9+oAZepYMTFoDnA95A==
Received: from smtpclient.apple (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-100-percent-11 (Postfix) with ESMTPSA id 09D53180012D;
	Wed, 13 May 2026 10:53:40 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "M.samet Duman" <dumanmehmetsamet@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v4] staging: fbtft: convert sysfs attributes to use ATTRIBUTE_GROUPS
Date: Wed, 13 May 2026 13:53:27 +0300
Message-Id: <0A2BDB7E-596B-41F8-9CD6-C5281F5D311F@icloud.com>
References: <2026051345-calculate-elves-048a@gregkh>
Cc: Harshit Shaw <shawharshit116@gmail.com>, andriy.shevchenko@intel.com,
 error27@gmail.com, deller@gmx.de, chintanlike@gmail.com, tzimmermann@suse.de,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <2026051345-calculate-elves-048a@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: iPhone Mail (23D8133)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNCBTYWx0ZWRfX6qvMB799uSFo
 O9qTprOPA1T4QPmjDtLFlnGAt3ds2QqdMaL80MiRZTuFP8D7qggCpIFuWHxO16/s92E5BwFkNhD
 +V1BqANeZe24oZITwo5TqXZqXLqpggaihfaF7M6C3ufJRX84uMw8CpltrAo9Q9qHi4VQg5oqtOn
 mkQu9TDB543JhLqvcfhViKW0C5vjCGyUZg9zQeLtFdJIBFZp08X2ai9UFRRmhPLvnHf+2pK5skU
 XTASupAXDBDapk4wySoElM61DdgCkeZBhQRXsbJjiW/7k1z+y1Ovu2/brksJmV8NsKqhl/RCmUH
 lNd8c1kxYqD7Ctqy34PaGD62a/jDt7yH7L1cDdFaBq/3YR/ndPEQCtsfIv4Jzc=
X-Authority-Info-Out: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=6a045835
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=x7bEGLp0ZPQA:10 a=aRhIMoA-k8UA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Z5a0sSWKEItb0iRT70kA:9
 a=QEXdDO2ut3YA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: URTu2KYFslU3py-9c1Yn9jUL4hMzxhKx
X-Proofpoint-ORIG-GUID: URTu2KYFslU3py-9c1Yn9jUL4hMzxhKx

A correction coming so quickly... I've only just started my day, and this is=
  4th v4.

--
Samet

> 2026. 5. 13. =EC=98=A4=ED=9B=84 1:39, Greg KH <gregkh@linuxfoundation.org>=
 =EC=9E=91=EC=84=B1:
>=20
> =EF=BB=BFOn Wed, May 13, 2026 at 08:59:48AM +0000, Harshit Shaw wrote:
>> Replace direct device_create_file() calls with the correct
>> ATTRIBUTE_GROUPS() macro. Add fbtft_groups as dev_groups in the
>> driver structure so the driver core automatically adds and removes
>> the sysfs attributes when a device is bound or unbound.
>>=20
>> Signed-off-by: Harshit Shaw <shawharshit116@gmail.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> ---
>> v4: Fix build error - add extern declaration of fbtft_groups in
>>    fbtft.h so all drivers using FBTFT_REGISTER_DRIVER macro can
>>    see the symbol
>> v3: Remove stray blank line in fbtft_attrs[] array
>> v2: - Use DEVICE_ATTR_RW() macro instead of DEVICE_ATTR()
>>    - Move DEVICE_ATTR_RW() definitions closer to their callbacks
>>    - Remove trailing comma after NULL in attribute array
>>    - Use ATTRIBUTE_GROUPS() macro and add dev_groups to driver
>>      structure as suggested by Greg KH and Andy Shevchenko
>>    - Compile tested with: make M=3Ddrivers/staging/fbtft modules
>=20
> I see too many v4 versions on the list for there really to be just 1 v4
> :(
>=20
> Please wait a bit, take some time, and resubmit a new version after a
> few days making sure it's all correct.  There is no rush or deadline
> here.
>=20
> thanks,
>=20
> greg k-h
>=20
